import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/channels/master_channel/follower_channel.dart';
import 'package:maxi_dart_framework/src/channels/master_channel/master_logic_channel.dart';

class MasterChannel<R, S> implements Channel<R, S>, Disposable, DisposableMixin {
  final _MasterLogicChannel<R, S> _masterLogicChannel;

  new() : _masterLogicChannel = _MasterLogicChannel<R, S>();

  @override
  Result<Stream<R>> getReceiver() => _masterLogicChannel.getStreamFromMaster();

  @override
  Result<void> sendItem(S item) => _masterLogicChannel.publishItem(item);

  @override
  void dispose() {
    _masterLogicChannel.dispose();
  }

  @override
  bool get isDisposed => _masterLogicChannel.isDisposed;

  @override
  void performDisposal() {
    _masterLogicChannel.dispose();
  }
}

class _MasterLogicChannel<R, S> with DisposableMixin, WithLifecycleScopeMixin implements MasterLogicChannel<R, S> {
  StreamController<S>? _streamFollowerController;
  StreamController<R>? _streamMasterController;

  Result<Channel<S, R>> buildFollowerChannel() => resultScopeValue(() {
    checkDisposed().$;

    final newFollower = FollowerChannel(masterLogicChannel: this);
    heart.attachChild(newFollower);

    return newFollower;
  });

  @override
  Result<void> followerPublishItem(R item) => resultScopeVoid(() {
    checkDisposed().$;

    _streamMasterController?.add(item);
  });

  @override
  Result<Stream<S>> getStreamFromFollowers() => resultScopeValue(() {
    checkDisposed().$;

    _streamFollowerController ??= heart.attachStreamController(StreamController<S>.broadcast());
    return _streamFollowerController!.stream;
  });

  Result<Stream<R>> getStreamFromMaster() => resultScopeValue(() {
    checkDisposed().$;

    _streamMasterController ??= heart.attachStreamController(StreamController<R>.broadcast());
    return _streamMasterController!.stream;
  });

  @override
  Result<void> publishItem(S item) => resultScopeVoid(() {
    checkDisposed().$;

    _streamFollowerController?.add(item);
  });

  @override
  void performDisposal() {
    super.performDisposal();
    _streamFollowerController?.close();
    _streamFollowerController = null;
    _streamMasterController?.close();
    _streamMasterController = null;
  }
}
