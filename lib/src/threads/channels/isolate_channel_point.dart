import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class IsolateChannelPoint implements Channel {
  int get isolateId;
}

class InitIsolateChannelPoint with DisposableMixin, WithLifecycleScopeMixin implements Channel, IsolateChannelPoint {
  StreamController<dynamic>? _controller;

  final _receivePort = ReceivePort();
  final _initWaiterCompleter = Completer<void>();

  late final SendPort sendPort;

  @override
  bool get isActive => !isDisposed;

  int _isolateId = -1;
  SendPort? _senderThread;

  @override
  int get isolateId => _isolateId;

  InitIsolateChannelPoint() {
    _receivePort.listen(_processReceivedItem, onDone: dispose);
    sendPort = _receivePort.sendPort;
    heart.onDispose(() => _receivePort.close());
  }

  @override
  Result<Stream<dynamic>> getReceiver() => resultScope(() {
    checkDisposed().$;

    _controller ??= heart.attachStreamController(StreamController<dynamic>.broadcast());
    return Result.value(_controller!.stream);
  });

  @override
  Result<void> sendItem(item) => resultScope(() {
    checkDisposed().$;
    if (_senderThread == null) {
      return Result.error('Sender thread is not initialized for isolate %', [isolateId.toString()]);
    }

    volatileScope(message: Oration('Failed to send item to sender thread of isolate %', [isolateId.toString()]), function: () => _senderThread?.send(item)).$;
    return Result.ok;
  });

  void _processReceivedItem(dynamic message) {
    if (_senderThread == null) {
      if (message is (SendPort, int)) {
        _senderThread = message.$1;
        _isolateId = message.$2;
        _initWaiterCompleter.complete();
      } else {
        log('Cannot process item: SendPort and id are required prior to execution');
      }

      return;
    }

    _controller?.add(message);
  }

  Future<void> waitInit() => _initWaiterCompleter.future;
}

class EndIsolateChannelPoint with DisposableMixin, WithLifecycleScopeMixin implements Channel, IsolateChannelPoint {
  final int currentID;
  final int initID;
  final SendPort initSendPort;

  late final StreamController<dynamic> _receiverController;

  @override
  int get isolateId => initID;

  @override
  bool get isActive => !isDisposed;

  final _receivePort = ReceivePort();

  new({required this.currentID, required this.initID, required this.initSendPort}) {
    initSendPort.send((_receivePort.sendPort, currentID));
    heart.attachStream(stream: _receivePort, onData: _processReceivedItem, onDone: dispose);
    _receiverController = heart.attachStreamController(StreamController<dynamic>.broadcast());
  }

  @override
  Result<Stream<dynamic>> getReceiver() => resultScope(() {
    checkDisposed().$;
    return Result.value(_receiverController.stream);
  });

  @override
  Result<void> sendItem(item) => resultScopeVoid(() {
    checkDisposed().$;
    volatileScope(message: Oration('Failed to send item to initSendPort number %', [initID.toString()]), function: () => initSendPort.send(item)).$;
  });

  void _processReceivedItem(dynamic message) {
    if (isDisposed) {
      log('Received message after disposal: $message');
      return;
    }
    _receiverController.add(message);
  }
}
