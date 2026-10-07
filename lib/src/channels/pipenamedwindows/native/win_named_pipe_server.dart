import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';

import 'package:ffi/ffi.dart';
import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/channels/pipenamedwindows/native/win_named_pipe_client.dart';
import 'package:maxi_dart_framework/src/channels/pipenamedwindows/win_named_pipe.dart';
import 'package:win32/win32.dart';

String _path(String name) => '\\\\.\\pipe\\$name';
HANDLE _handle(int addr) => HANDLE(Pointer.fromAddress(addr));

class ImplPipeNamedPipeServer with DisposableMixin, WithLifecycleScopeMixin, SynchronousInitializationMixin implements WinPipeNamedServer {
  final String name;
  late final HANDLE _stop; // manual-reset event: once signaled, it stays that way
  final _clients = DisposableLinkedList<PipeChannelWinClient>();

  late final StreamController<PipeChannelWinClient> _clientController;

  ImplPipeNamedPipeServer(this.name);

  @override
  Stream<Channel<List<int>, List<int>>> get onNewClient => resultScopeValue(() {
    checkDisposed().$;
    initialize().$;

    return _clientController.stream;
  }).$;

  @override
  Result<void> performInitialization() => resultScopeVoid(() {
    final result = CreateEvent(null, true, false, null);
    if (!result.value.isValid) throw WindowsException(result.error.toHRESULT());
    _stop = result.value;

    _clientController = heart.attachStreamController<PipeChannelWinClient>(StreamController<PipeChannelWinClient>.broadcast());

    heart.onDispose(() => _clients.dispose());

    scheduleMicrotask(_listening);
  });

  Future<void> _listening() async {
    // Isolate.run copies what the closure captures: only simple values,
    // never `this` (it has StreamControllers and ReceivePorts).
    final name = this.name;
    final stop = _stop.address;
    try {
      while (!isDisposed) {
        final addr = await Isolate.run(() => _waitClient(name, stop));
        if (addr == null) break;
        if (isDisposed) {
          // A client entered just as we were closing: it is discarded.
          CloseHandle(_handle(addr));
          break;
        }
        final client = PipeChannelWinClient(_handle(addr));
        _clients.addLast(client);
      }
    } finally {
      CloseHandle(_stop);
      dispose();
    }
  }

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

  /// Creates a pipe instance and waits for a client or the stop signal.
  /// Returns the address of the connected HANDLE, or null if listening should stop.
  int? _waitClient(String name, int stopAddr) {
    final path = _path(name).toPcwstr();
    final handle = CreateNamedPipe(
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
    if (!handle.isValid) return null;

    final overlapped = _createOverlapped();
    final bytes = calloc<Uint32>();
    final events = calloc<Pointer>(2);
    try {
      final result = ConnectNamedPipe(handle, overlapped);
      if (result.value || result.error == ERROR_PIPE_CONNECTED) return handle.address;
      if (result.error != ERROR_IO_PENDING) {
        CloseHandle(handle);
        return null;
      }

      // Wait for whichever happens first: client (index 0) or stop (index 1).
      events[0] = overlapped.ref.hEvent;
      events[1] = _handle(stopAddr);
      final waitResult = WaitForMultipleObjects(2, events, false, INFINITE);

      if (waitResult.value == WAIT_OBJECT_0 && GetOverlappedResult(handle, overlapped, bytes, false).value) {
        return handle.address; // client arrived
      }

      // Stop (or error): cancel the pending ConnectNamedPipe and wait for the
      // cancellation to finish before releasing the OVERLAPPED.
      CancelIoEx(handle, overlapped);
      GetOverlappedResult(handle, overlapped, bytes, true);
      CloseHandle(handle);
      return null;
    } finally {
      _releaseOverlapped(overlapped);
      calloc.free(bytes);
      calloc.free(events);
    }
  }
}
