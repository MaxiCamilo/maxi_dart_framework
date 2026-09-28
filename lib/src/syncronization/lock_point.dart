import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class LockPoint with DisposableMixin {
  Completer<Result>? _completer;

  FutureResult<T> reserve<T>({required Duration timeout, Duration? maxLifetime, ResultFailure? timeoutError, required FutureOr<Result<T>> Function() body}) => futureScope(() async {
    do {
      if (_completer != null && !_completer!.isCompleted) {
        break;
      }
      checkDisposed().$;
      final waitResult = await _completer!.future.timeout(
        timeout,
        onTimeout: () => timeoutError ?? Result.error('Timed out waiting for the release of a reserved feature'),
      );
      if (waitResult is ResultFailure) {
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

  @override
  void performDisposal() {
    _completer?.complete(Result.error('LockPoint disposed'));
    _completer = null;
  }
}
