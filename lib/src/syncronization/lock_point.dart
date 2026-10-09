import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class LockPointKey implements Disposable, WithLifecycleScope {}

class LockPoint with DisposableMixin {
  Completer<Result>? _completer;

  FutureResult<T> reserve<T>({required Duration timeout, Duration? maxLifetime, NegativeResult? timeoutError, required FutureOr<Result<T>> Function() body}) => futureScope(() async {
    do {
      if (_completer == null || _completer!.isCompleted) {
        break;
      }
      checkDisposed().$;
      final waitResult = await _completer!.future.timeout(
        timeout,
        onTimeout: () => timeoutError ?? Result.error('Timed out waiting for the release of a reserved feature'),
      );
      if (waitResult is NegativeResult) {
        return (waitResult).cast<T>();
      }
    } while (_completer != null && !_completer!.isCompleted);

    checkDisposed().$;
    _completer = Completer<Result>();
    try {
      return await body();
    } finally {
      _completer?.complete(Result.ok);
    }
  });

  FutureResult<LockPointKey> reserveKey({required Duration timeout, NegativeResult? timeoutError}) async {
    do {
      if (_completer == null || _completer!.isCompleted) {
        break;
      }
      checkDisposed().$;
      final waitResult = await _completer!.future.timeout(
        timeout,
        onTimeout: () => timeoutError ?? Result.error('Timed out waiting for the release of a reserved feature'),
      );
      if (waitResult is NegativeResult) {
        return (waitResult).cast<LockPointKey>();
      }
    } while (_completer != null && !_completer!.isCompleted);

    checkDisposed().$;
    _completer = Completer<Result>();
    final key = _LockPointKey(() {
      _completer?.complete(Result.ok);
      _completer = null;
    });
    return Result.value(key);
  }

  @override
  void performDisposal() {
    _completer?.complete(Result.error('LockPoint disposed'));
    _completer = null;
  }
}

class _LockPointKey with DisposableMixin, WithLifecycleScopeMixin implements LockPointKey {
  final Function _onDispose;

  new(this._onDispose);

  @override
  void performDisposal() {
    super.performDisposal();
    _onDispose();
  }
}
