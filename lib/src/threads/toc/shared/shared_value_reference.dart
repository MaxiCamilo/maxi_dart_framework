import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task_manager.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task_manager_extension.dart';
import 'package:maxi_dart_framework/src/threads/toc/shared/shared_value_manager.dart';

class SharedValueReference with DisposableMixin, WithLifecycleScopeMixin, AsynchronousInitializationMixin implements SharedValueManager {
  final IsolateTaskManager taskManager;

  new({required this.taskManager});

  @override
  FutureResult<void> performInitialization() => futureScopeVoid(() async {
    await taskManager.obtainThreadChannel(1).$;
  });

  @override
  FutureResult<T> getSharedValue<T>(String name) => futureScope(() async {
    checkDisposed().$;
    await initialize().$;

    return await taskManager.addNewTask(
      threadID: 1,
      parameters: InvocationParameters.only(name),
      function: (para) => futureScope(() => Toc.kInstance.getSharedValue<T>(para.first<String>().$)),
    );
  });

  @override
  Future<Result<R>> invokeSharedValue<T, R>(String name, FutureOr<Result<R>> Function(T) callback) => futureScope(() async {
    checkDisposed().$;
    await initialize().$;

    return await taskManager.addNewTask(
      threadID: 1,
      parameters: InvocationParameters.list([name, callback]),
      function: (para) => futureScope(() => Toc.kInstance.invokeSharedValue<T, R>(para.first<String>().$, para.second<FutureOr<Result<R>> Function(T)>().$)),
    );
  });

  @override
  Future<Result<void>> setSharedOperatorValue<T extends Disposable>(String name, T value, [bool disposePrevious = false]) => futureScope(() async {
    checkDisposed().$;
    await initialize().$;

    return await taskManager.addNewTask(
      threadID: 1,
      parameters: InvocationParameters.list([name, value, disposePrevious]),
      function: (para) => futureScope(
        () => Toc.kInstance.setSharedOperatorValue<T>(
          para.first<String>().$,
          para.second<T>().$,
          para.third<bool>().$,
        ),
      ),
    );
  });

  @override
  FutureResult<void> setSharedValue<T>(String name, T value) => futureScope(() async {
    checkDisposed().$;
    await initialize().$;

    return await taskManager.addNewTask(
      threadID: 1,
      parameters: InvocationParameters.list([name, value]),
      function: (para) => futureScope(
        () => Toc.kInstance.setSharedValue<T>(
          para.first<String>().$,
          para.second<T>().$,
        ),
      ),
    );
  });
}
