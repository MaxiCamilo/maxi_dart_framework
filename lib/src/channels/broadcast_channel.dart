import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class BroadcastChannel<T> with DelegateLifetime implements Channel<T, T> {
  final _BroadcastLogicChannel<T> _logic;
  final int _identifier;

  @override
  bool get isActive => !isDisposed;

  BroadcastChannel() : _logic = _BroadcastLogicChannel<T>(), _identifier = 0 {
    _logic.attach(this);
  }

  BroadcastChannel._fork(this._identifier, this._logic);

  @override
  LifecycleScope get heart => _logic.heart;

  @override
  Result<Stream<T>> getReceiver() => _logic.getStream(_identifier);

  @override
  Result<void> sendItem(T item) => _logic.sendItem(_identifier, item);
}

class _BroadcastLogicChannel<T> with DisposableMixin, WithLifecycleScopeMixin {
  int _lastID = 0;
  int _counter = 0;
  StreamController<(int, T)>? _streamController;

  Result<void> attach(BroadcastChannel<T> channel) => resultScopeVoid(() {
    checkDisposed().$;
    _lastID += 1;
    _counter += 1;

    heart.attachChild(channel, _onChannelClosed);
  });

  Result<BroadcastChannel<T>> buildNewChannel() => resultScopeValue(() {
    checkDisposed().$;

    final newChannel = BroadcastChannel._fork(_lastID, this);
    attach(newChannel).$;
    return newChannel;
  });

  Result<Stream<T>> getStream(int identifier) => resultScopeValue(() {
    checkDisposed().$;

    _streamController ??= heart.attachStreamController(StreamController<(int, T)>.broadcast());
    return _streamController!.stream.where((tuple) => tuple.$1 != identifier).map((tuple) => tuple.$2);
  });

  Result<void> sendItem(int identifier, T item) => resultScopeVoid(() {
    checkDisposed().$;

    _streamController ??= heart.attachStreamController(StreamController<(int, T)>.broadcast());
    _streamController!.add((identifier, item));
  });

  void _onChannelClosed(BroadcastChannel<T> _) {
    _counter -= 1;
    if (_counter == 0) {
      dispose();
    }
  }
}
