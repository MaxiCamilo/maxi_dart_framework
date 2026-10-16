import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/logic/build_isolate_stream.dart';
import 'package:maxi_dart_framework/src/threads/toc/main_isolate_instance.dart';
import 'package:meta/meta.dart';

FutureResult<T> toc$<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function}) {
  return Toc.execute<T>(parameters: parameters, function: function);
}

Future<T> toc$_<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function}) {
  return $$_(toc$<T>(parameters: parameters, function: function));
}

abstract interface class IToc {
  //FutureResult<TaskInstance<T>> buildExecution<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function});
  bool get isMainThread;

  FutureResult<T> execute<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function});

  FutureResult<T> executeOnManager<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(MainTocValueManager, InvocationParameters) function});

  Future<Result<Channel<R, S>>> connectToSharedValue<R, S>(Channel<R, S> channel);
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

  static Future<Result<Channel<R, S>>> connectToSharedValue<R, S>(Channel<R, S> channel) => kInstance.connectToSharedValue<R, S>(channel);

  static Future<Result<Channel<S, R>>> connectToMasterChannel<R, S>(MasterChannel<R, S> masterChannel) => futureScope(() => kInstance.connectToSharedValue<S, R>(masterChannel.buildFollowerChannel().$));

  static FutureResult<Stream<T>> connectStream<T>({InvocationParameters parameters = InvocationParameters.empty, required Future<Result<Stream<T>>> Function(InvocationParameters) function}) {
    return BuildIsolateStream(parameters: parameters, function: function).run();
  }

  static FutureResult<T> executeOnManager<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(MainTocValueManager, InvocationParameters) function}) {
    return kInstance.executeOnManager<T>(parameters: parameters, function: function);
  }

  static Result<void> checkOnlyMainThread() {
    if (kInstance.isMainThread) {
      return Result.ok;
    } else {
      return Result.error('This functionality only execute on the main thread');
    }
  }
}
