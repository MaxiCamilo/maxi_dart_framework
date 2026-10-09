import 'dart:async';

import 'package:maxi_dart_framework/src/translate/oration.dart';

typedef FutureResult<T> = Future<Result<T>>;
typedef FutureResultOr<T> = FutureOr<Result<T>>;

typedef EmptyResult = Result<void>;
typedef FutureEmptyResult<T> = Future<Result<void>>;
typedef FutureEmptyResultOr<T> = FutureOr<Result<void>>;

const voidResult = SuccessfulResult<void>(null);

sealed class Result<T> {
  const Result();

  static Result<void> get ok => voidResult;

  static Result<T> value<T>(T value) {
    return SuccessfulResult<T>(value);
  }

  static Result<T> error<T>(String s, [List<String>? args]) {
    if (args == null) {
      return Invalidation<T>(message: Oration(s));
    } else {
      return Invalidation<T>(message: Oration(s, args));
    }
  }
}

final class SuccessfulResult<T> extends Result<T> {
  final T value;
  const SuccessfulResult(this.value);
}

sealed class NegativeResult<T> extends Result<T> {
  Oration get message;

  const new();

  NegativeResult<R> cast<R>();
}

final class Invalidation<T> extends NegativeResult<T> {
  @override
  final Oration message;

  const new({required this.message});

  @override
  Invalidation<R> cast<R>() => Invalidation<R>(message: message);
}

final class CancelationResult<T> extends NegativeResult<T> {
  @override
  final Oration message;

  final StackTrace stackTrace;

  new([Oration? message]) : message = message ?? const Oration('The functionality was canceled'), stackTrace = StackTrace.current;

  @override
  CancelationResult<R> cast<R>() => CancelationResult<R>(message);
}

final class ExceptionResult<T> extends NegativeResult<T> {
  @override
  final Oration message;
  final Object exception;
  final StackTrace stackTrace;

  new({
    required this.exception,
    required this.stackTrace,
    Oration? message,
  }) : message = message ?? Oration('An unknown error occurred while executing the functionality: ?', [exception.toString()]);

  @override
  ExceptionResult<R> cast<R>() => ExceptionResult<R>(exception: exception, stackTrace: stackTrace, message: message);
}
