import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/toc/main_isolate_instance.dart';
import 'package:meta/meta.dart';

abstract interface class IToc {
  //FutureResult<TaskInstance<T>> buildExecution<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function});
  FutureResult<T> execute<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function});
  FutureResult<T> getSharedValue<T>(String name);
  FutureResult<void> setSharedValue<T>(String name, T value);

  Future<Result<R>> invokeSharedValue<T, R>(String name, FutureOr<Result<R>> Function(T) callback);
  Future<Result<void>> setSharedOperatorValue<T extends Disposable>(String name, T value, [bool disposePrevious = false]);
}

mixin Toc {
  @internal
  static IToc kInstance = MainIsolateInstance();

  @internal
  static const Symbol kTocSymbol = #toc;
  @internal
  static const Symbol kIsolateThreadRequestID = #isolateThreadRequestID;
  @internal
  static const Symbol kIsolateCurrentThreadID = #isolateCurrentThreadID;

  static Result<IToc> getTocZone() => resultScope(() {
    final toc = Zone.current[#toc];
    if (toc == null) {
      return Result.error('TOC not found in the current zone');
    }

    if (toc is IToc) {
      return Result.value(toc);
    } else {
      return Result.error('TOC found in the current zone is not of type IToc');
    }
  });

  static Result<int> getThreadID() => resultScope(() {
    final id = Zone.current[#isolateCurrentThreadID];
    if (id == null) {
      return Result.error('Thread ID not found in the current zone');
    }

    if (id is int) {
      return Result.value(id);
    } else {
      return Result.error('Thread ID is not an integer');
    }
  });

  static Result<int> getThreadRequestID() => resultScope(() {
    final id = Zone.current[#isolateThreadRequestID];
    if (id == null) {
      return Result.error('Thread Request ID not found in the current zone');
    }

    if (id is int) {
      return Result.value(id);
    } else {
      return Result.error('Thread Request ID is not an integer');
    }
  });

  static FutureResult<T> execute<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function}) {
    return kInstance.execute<T>(parameters: parameters, function: function);
  }

  static FutureResult<T> getSharedValue<T>(String name) {
    return kInstance.getSharedValue<T>(name);
  }

  static FutureResult<void> setSharedValue<T>(String name, T value) {
    return kInstance.setSharedValue<T>(name, value);
  }

  static Future<Result<R>> invokeSharedValue<T, R>(String name, FutureOr<Result<R>> Function(T) callback) {
    return kInstance.invokeSharedValue<T, R>(name, callback);
  }

  static Future<Result<void>> setSharedOperatorValue<T extends Disposable>(String name, T value, [bool disposePrevious = false]) {
    return kInstance.setSharedOperatorValue<T>(name, value, disposePrevious);
  }
}
