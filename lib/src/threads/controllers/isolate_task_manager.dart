import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_channel_point.dart';

class IsolateTaskManager with DisposableMixin, WithLifecycleScopeMixin {
  final int currentIsolateID;
  late final DisposableLinkedList<IsolateChannelPoint> _channels = heart.attachChild(DisposableLinkedList<IsolateChannelPoint>());

  new({required this.currentIsolateID});

  Result<void> connectChannel({required IsolateChannelPoint channel}) => resultScopeVoid(() {
    checkDisposed().$;

    final stream = channel.getReceiver().$;
    heart.attachStream(stream: stream, onData: (data) => _processMessage(channel, data));
    _channels.attachLast(channel);
  });

  void _processMessage(IsolateChannelPoint channel, data) {
    
  }
}
