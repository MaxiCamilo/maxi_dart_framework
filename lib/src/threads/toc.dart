import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class IToc {
  FutureResult<TaskInstance<T>> buildExecution<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function});
  FutureResult<T> execute<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function});
}

mixin Toc {}
