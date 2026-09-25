import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/channels/master_channel/master_logic_channel.dart';

class FollowerChannel<R, S> with DisposableMixin implements Channel<R, S> {
  final MasterLogicChannel<S, R> masterLogicChannel;

  @override
  bool get isActive => !isDisposed;

  new({required this.masterLogicChannel});

  @override
  Result<Stream<R>> getReceiver() => resultScope(() {
    checkDisposed().$;
    return masterLogicChannel.getStreamFromFollowers();
  });

  @override
  Result<void> sendItem(S item) => resultScope(() {
    checkDisposed().$;
    return masterLogicChannel.followerPublishItem(item);
  });

  @override
  void performDisposal() {}
}
