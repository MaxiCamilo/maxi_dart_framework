import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class MainTocValueManager {
  FutureResult<bool> hasSharedValue<T>(String name);
  FutureResult<T> getSharedValue<T>(String name, [T? defaultValue]);
  FutureResult<void> setSharedValue<T>(String name, T value);
  FutureResult<void> removeSharedValue(String name);
  FutureResult<R> invokeSharedValue<T, R>(String name, InvocationParameters parameters, FutureOr<Result<R>> Function(T, InvocationParameters parameters) callback);
  FutureResult<Stream<T>> reactToValueChange<T>(String name);

  FutureResult<bool> hasSharedOperator<T extends Disposable>();
  FutureResult<void> setSharedOperator<T extends Disposable>(T value, [bool disposePrevious = false]);
  FutureResult<R> invokeSharedOperator<T extends Disposable, R>(InvocationParameters parameters, Future<Result<R>> Function(T, InvocationParameters parameters) callback);
}
