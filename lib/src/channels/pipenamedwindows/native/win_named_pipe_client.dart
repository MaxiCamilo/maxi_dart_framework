// Windows named pipes via FFI — package:win32 6.x
import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:meta/meta.dart';
import 'package:win32/win32.dart';

String _path(String name) => '\\\\.\\pipe\\$name';
HANDLE _handle(int addr) => HANDLE(Pointer.fromAddress(addr));

/// OVERLAPPED with its own manual-reset event.
Pointer<OVERLAPPED> _createOverlapped() {
  final overlapped = calloc<OVERLAPPED>();
  final result = CreateEvent(null, true, false, null);
  if (!result.value.isValid) {
    calloc.free(overlapped);
    throw WindowsException(result.error.toHRESULT());
  }
  overlapped.ref.hEvent = result.value;
  return overlapped;
}

void _releaseOverlapped(Pointer<OVERLAPPED> overlapped) {
  CloseHandle(overlapped.ref.hEvent);
  calloc.free(overlapped);
}

/// Waits for an overlapped operation. Returns the transferred bytes, or null if it failed.
int? _waitIO(HANDLE h, Pointer<OVERLAPPED> overlapped, Win32Result<bool> start, Pointer<Uint32> bytes) {
  if (!start.value && start.error != ERROR_IO_PENDING) return null;
  return GetOverlappedResult(h, overlapped, bytes, true).value ? bytes.value : null;
}

/// Channel over named pipe (Windows).
class PipeChannelWinClient with DisposableMixin, WithLifecycleScopeMixin implements Channel<List<int>, List<int>> {
  final HANDLE _h;
  final _ctrl = StreamController<List<int>>();
  final _rp = ReceivePort();

  @internal
  PipeChannelWinClient(this._h) {
    heart.attachStream(
      stream: _rp,
      onData: (message) {
        if (message == null) {
          _rp.close();
          _ctrl.close();
        } else {
          _ctrl.add((message as TransferableTypedData).materialize().asUint8List());
        }
      },
    );
    Isolate.spawn(_readDataOnIsolate, (_h.address, _rp.sendPort));
    heart.onDispose(() => CancelIoEx(_h, null));
  }

  @override
  Result<Stream<List<int>>> getReceiver() => resultScopeValue(() {
    checkDisposed().$;
    return _ctrl.stream;
  });

  /// Returns null if there is no listening service.
  static PipeChannelWinClient? connect(String name) {
    final path = _path(name).toPcwstr();
    try {
      final Win32Result(value: h) = CreateFile(
        path,
        GENERIC_READ | GENERIC_WRITE,
        FILE_SHARE_MODE(0),
        null,
        OPEN_EXISTING,
        FILE_FLAG_OVERLAPPED,
        null,
      );
      return h.isValid ? PipeChannelWinClient(h) : null;
    } finally {
      free(path);
    }
  }

  @override
  bool get isActive => !isDisposed;

  @override
  Result<void> sendItem(List<int> item) => resultScopeVoid(() {
    checkDisposed().$;
    final buffer = calloc<Uint8>(item.length)..asTypedList(item.length).setAll(0, item);
    final bytes = calloc<Uint32>();
    final overlapped = _createOverlapped();
    try {
      final result = WriteFile(_h, buffer, item.length, bytes, overlapped);
      if (_waitIO(_h, overlapped, result, bytes) == null) {
        throw WindowsException(result.error.toHRESULT());
      }
    } finally {
      _releaseOverlapped(overlapped);
      calloc.free(bytes);
      calloc.free(buffer);
    }
  });

  @internal
  static Stream<PipeChannelWinClient> mountServer(String name) async* {
    while (true) {
      final addr = await Isolate.run(() => _waitClient(name));
      if (addr == null) break;
      yield PipeChannelWinClient(_handle(addr));
    }
  }
}

void _readDataOnIsolate((int, SendPort) args) {
  final (addr, port) = args;
  final h = _handle(addr);
  const bufferSize = 65536;
  final buffer = calloc<Uint8>(bufferSize);
  final bytes = calloc<Uint32>();
  final overlapped = _createOverlapped();
  try {
    while (true) {
      ResetEvent(overlapped.ref.hEvent);
      final bytesRead = _waitIO(h, overlapped, ReadFile(h, buffer, bufferSize, bytes, overlapped), bytes);
      if (bytesRead == null) break; // broken pipe or canceled read
      if (bytesRead == 0) continue;
      port.send(TransferableTypedData.fromList([Uint8List.fromList(buffer.asTypedList(bytesRead))]));
    }
  } finally {
    _releaseOverlapped(overlapped);
    CloseHandle(h);
    calloc.free(bytes);
    calloc.free(buffer);
    port.send(null);
  }
}

int? _waitClient(String name) {
  final path = _path(name).toPcwstr();
  final h = CreateNamedPipe(
    path,
    PIPE_ACCESS_DUPLEX | FILE_FLAG_OVERLAPPED,
    PIPE_TYPE_BYTE | PIPE_READMODE_BYTE | PIPE_WAIT,
    PIPE_UNLIMITED_INSTANCES,
    65536,
    65536,
    0,
    null,
  );
  free(path);
  if (!h.isValid) return null;

  final overlapped = _createOverlapped();
  final bytes = calloc<Uint32>();
  try {
    final result = ConnectNamedPipe(h, overlapped);
    final ok = result.value || result.error == ERROR_PIPE_CONNECTED || (result.error == ERROR_IO_PENDING && GetOverlappedResult(h, overlapped, bytes, true).value);
    if (!ok) {
      CloseHandle(h);
      return null;
    }
    return h.address;
  } finally {
    _releaseOverlapped(overlapped);
    calloc.free(bytes);
  }
}
