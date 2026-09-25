import 'dart:async';
import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

final class _Propagate implements Exception {
  final ResultFailure failure;
  const _Propagate(this.failure);

  @override
  String toString() => failure.message.toString();
}

extension ResultTry<T> on Result<T> {
  /// Solo válido dentro de resultScope
  T get $ => switch (this) {
    ResultValue(:final value) => value,
    ResultFailure() => throw _Propagate(this as ResultFailure),
  };

  Result<T> logIfFailure(String message, [List<String>? parts]) {
    if (this is ResultFailure) {
      final failure = this as ResultFailure;
      log(message, name: 'ResultFailure', error: failure.message.toString(), stackTrace: StackTrace.current);
    }
    return this;
  }
}

extension FutureResultTry<T> on FutureOr<Result<T>> {
  FutureOr<T> get $ async => switch (await this) {
    ResultValue(:final value) => value,
    ResultFailure() => throw _Propagate(this as ResultFailure),
  };
}

extension ResultMap<T> on Result<T> {
  Result<R> map<R>(R Function(T) f) => switch (this) {
    ResultValue(:final value) => ResultValue(f(value)),
    ResultFailure() => (this as ResultFailure<T>).cast<R>(),
  };
}

extension FutureAsResult<T> on Future<T> {
  FutureResult<T> asResult([String? message, List<String>? parts]) async {
    try {
      final value = await this;
      return ResultValue(value);
    } on _Propagate catch (p) {
      return p.failure.cast<T>();
    } on NegativeResult catch (n) {
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
    return ResultValue(body());
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
    return ResultValue(function());
  } catch (ex, st) {
    return ExceptionResult(exception: ex, stackTrace: st, message: message ?? const Oration('An error occurred while executing a feature'));
  }
}

FutureResult<T> futureVolatileScope<T>({required FutureOr<T> Function() function, Oration? message}) async {
  try {
    return ResultValue(await function());
  } catch (ex, st) {
    return ExceptionResult(exception: ex, stackTrace: st, message: message ?? const Oration('An error occurred while executing a feature'));
  }
}
