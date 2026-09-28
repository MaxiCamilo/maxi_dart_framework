import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class SharedValueManager {
  FutureResult<T> getSharedValue<T>(String name);
  FutureResult<void> setSharedValue<T>(String name, T value);
  
  Future<Result<R>> invokeSharedValue<T, R>(String name, FutureOr<Result<R>> Function(T) callback);
  Future<Result<void>> setSharedOperatorValue<T extends Disposable>(String name, T value, [bool disposePrevious = false]);
}