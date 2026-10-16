import 'dart:developer';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task.dart';

class IsolateStartChannelPoint<R, S> with DisposableMixin, WithLifecycleScopeMixin {
  final Channel<R, S> channel;

  late final ReceivePort _receivePort = ReceivePort();

  SendPort? _sender;

  Result<SendPort> getSenderPoint() => resultScopeValue(() {
    checkDisposed().$;
    return _receivePort.sendPort;
  });

  IsolateStartChannelPoint({required this.channel}) {
    heart.onDispose(() {
      volatileScope(function: () => _sender?.send(kChannelCloseReserver));
      _sender = null;
      _receivePort.close();
    });
    heart.attachStream(stream: _receivePort, onData: _processData);
  }

  void _processData(dynamic data) {
    if (data == kChannelCloseReserver) {
      dispose();
      return;
    } else if (_sender == null) {
      if (data is SendPort) {
        _sender = data;
        heart.disposeWhereFail(_initData);
        return;
      } else {
        log('Received unexpected data before SendPort was set: $data');
        return;
      }
    }
    if (data is S) {
      channel.sendItem(data).logIfFailure('Failed to send item to channel');
    } else {
      log('Received unexpected data of type ${data.runtimeType}: $data');
    }
  }

  Result<void> _initData() => resultScope(() {
    checkDisposed().$;
    heart.attachStream(
      stream: channel.getReceiver().$,
      onData: (x) => _sender!.send(x),
    );

    return voidResult;
  });
}
