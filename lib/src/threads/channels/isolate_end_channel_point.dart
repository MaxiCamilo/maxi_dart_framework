import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task.dart';

class IsolateEndChannelPoint<R, S> with DisposableMixin, WithLifecycleScopeMixin, SynchronousInitializationMixin implements Channel<R, S> {
  final SendPort port;

  ReceivePort? _receivePort;
  StreamController<R>? _streamController;

  @override
  bool get isActive => !isDisposed && isInitialized;

  new({required this.port});

  @override
  Result<void> performInitialization() => resultScopeVoid(() {
    _receivePort = ReceivePort();
    heart.attachStreamSubscription(_receivePort!.listen(_reactNewItem, onDone: dispose));
    port.send(_receivePort!.sendPort);

    heart.onDispose(() {
      _receivePort?.close();
      _receivePort = null;
      volatileScope(function: () => port.send(kChannelCloseReserver));
    });

    _streamController = heart.attachStreamController(StreamController<R>.broadcast());
  });

  void _reactNewItem(dynamic message) {
    if (message == kChannelCloseReserver) {
      dispose();
      return;
    } else if (message is R) {
      _streamController?.add(message);
    } else {
      log('Received message of unexpected type: ${message.runtimeType} (expected: ${R.toString()})');
    }
  }

  @override
  Result<Stream<R>> getReceiver() => resultScopeValue(() {
    checkDisposed().$;
    initialize().$;
    return _streamController!.stream;
  });

  @override
  Result<void> sendItem(S item) => resultScopeVoid(() {
    checkDisposed().$;
    initialize().$;
    port.send(item);
  });
}
