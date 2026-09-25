import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:meta/meta.dart';

abstract base class Functionality<T> {
  const Functionality();

  @protected
  FutureResult<T> performExecution(ILifecycleScope scope);

  @nonVirtual
  FutureResult<T> run([ILifecycleScope? scope]) async {
    if (scope == null) {
      scope = LifecycleScopeFactory();
      try {
        return await performExecution(scope);
      } catch (ex, st) {
        return ExceptionResult(exception: ex, stackTrace: st, message: Oration('An error occurred while executing a feature on %', [runtimeType.toString()]));
      } finally {
        scope.dispose();
      }
    } else {
      return await performExecution(scope);
    }
  }
}

abstract base class Logic<T> {
  const Logic();

  @protected
  Result<T> performExecution(ILifecycleScope scope);

  @nonVirtual
  Result<T> run([ILifecycleScope? scope]) {
    if (scope == null) {
      scope = LifecycleScopeFactory();
      try {
        return performExecution(scope);
      } catch (ex, st) {
        return ExceptionResult(exception: ex, stackTrace: st, message: Oration('An error occurred while executing a feature on %', [runtimeType.toString()]));
      } finally {
        scope.dispose();
      }
    } else {
      return performExecution(scope);
    }
  }
}
