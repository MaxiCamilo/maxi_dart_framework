import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class MainIsolateInstance with DisposableMixin, WithLifecycleScopeMixin, AsynchronousInitializationMixin implements IToc {
  @override
  FutureResult<TaskInstance<T>> buildExecution<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function}) => futureScopeValue(() async {
    checkDisposed().$;
    initialize().$;
  });

  @override
  FutureResult<T> execute<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function}) {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  FutureResult<void> performInitialization() => futureScope(() async {
    
  });
}
