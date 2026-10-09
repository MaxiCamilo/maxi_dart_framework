import 'dart:async';
import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

final class _Propagate implements Exception {
  final NegativeResult failure;
  const _Propagate(this.failure);

  @override
  String toString() => failure.message.toString();
}

extension ResultTry<T> on Result<T> {
  /// Solo válido dentro de resultScope
  T get $ => switch (this) {
    SuccessfulResult(:final value) => value,
    NegativeResult() => throw _Propagate(this as NegativeResult),
  };

  Result<T> logIfFailure(String message, [List<String>? parts]) {
    if (this is NegativeResult) {
      final failure = this as NegativeResult;
      log(message, name: 'NegativeResult', error: failure.message.toString(), stackTrace: StackTrace.current);
    }
    return this;
  }
}

T $_<T>(Oration message, T Function() function) {
  try {
    return function();
  } on _Propagate catch (_) {
    rethrow;
  } catch (ex, st) {
    throw ExceptionResult(exception: ex, stackTrace: st, message: message);
  }
}

Future<T> $$_<T>(FutureOr<Result<T>> future) async {
  final result = await future;
  if (result is SuccessfulResult<T>) {
    return result.value;
  } else if (result is NegativeResult) {
    throw _Propagate(result as NegativeResult);
  } else {
    throw _Propagate(ExceptionResult(exception: Exception('Unexpected result type'), stackTrace: StackTrace.current, message: const Oration('An error occurred while executing a feature')));
  }
}

Future<T> $$<T>(Oration message, FutureOr<T> Function() function) async {
  try {
    return await function();
  } on _Propagate catch (_) {
    rethrow;
  } catch (ex, st) {
    throw ExceptionResult(exception: ex, stackTrace: st, message: message);
  }
}

extension ResultMap<T> on Result<T> {
  Result<R> map<R>(R Function(T) f) => switch (this) {
    SuccessfulResult(:final value) => SuccessfulResult(f(value)),
    NegativeResult() => (this as NegativeResult<T>).cast<R>(),
  };
}

extension FutureAsResult<T> on Future<T> {
  FutureResult<T> asResult([String? message, List<String>? parts]) async {
    try {
      final value = await this;
      return SuccessfulResult(value);
    } on _Propagate catch (p) {
      return p.failure.cast<T>();
    } on Invalidation catch (n) {
      return n.cast<T>();
    } catch (ex, st) {
      return ExceptionResult(
        exception: ex,
        stackTrace: st,
        message: message != null ? Oration(message, parts != null ? [...parts, ex.toString()] : [ex.toString()]) : const Oration('An error occurred while executing a feature'),
      );
    }
  }
}

Result<T> resultScope<T>(Result<T> Function() body) {
  try {
    return body();
  } on _Propagate catch (p) {
    return p.failure.cast<T>();
  }
}

Result<T> resultScopeValue<T>(T Function() body) {
  try {
    return SuccessfulResult(body());
  } on _Propagate catch (p) {
    return p.failure.cast<T>();
  }
}

Result<void> resultScopeVoid(void Function() body) {
  try {
    body();
    return Result.ok;
  } on _Propagate catch (p) {
    return p.failure.cast<void>();
  }
}

FutureResult<T> futureScope<T>(FutureResultOr<T> Function() body) async {
  try {
    return await body();
  } on _Propagate catch (p) {
    return p.failure.cast<T>();
  }
}

FutureResult<void> futureScopeVoid(Future<void> Function() body) async {
  try {
    await body();
    return Result.ok;
  } on _Propagate catch (p) {
    return p.failure.cast<void>();
  }
}

FutureResult<T> futureScopeValue<T>(FutureOr<T> Function() body) async {
  try {
    return Result.value(await body());
  } on _Propagate catch (p) {
    return p.failure.cast<T>();
  }
}

Result<T> volatileScope<T>({required T Function() function, Oration? message}) {
  try {
    return SuccessfulResult(function());
  } catch (ex, st) {
    return ExceptionResult(exception: ex, stackTrace: st, message: message ?? const Oration('An error occurred while executing a feature'));
  }
}

FutureResult<T> futureVolatileScope<T>({required FutureOr<T> Function() function, Oration? message}) async {
  try {
    return SuccessfulResult(await function());
  } catch (ex, st) {
    return ExceptionResult(exception: ex, stackTrace: st, message: message ?? const Oration('An error occurred while executing a feature'));
  }
}
