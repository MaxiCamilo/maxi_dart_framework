import 'dart:async';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task_manager.dart';
import 'package:maxi_dart_framework/src/threads/toc/shared/shared_value_instance.dart';
import 'package:maxi_dart_framework/src/threads/toc/shared/shared_value_manager.dart';
import 'package:maxi_dart_framework/src/threads/toc/shared/shared_value_reference.dart';

class ClientIsolateInstance with DisposableMixin, WithLifecycleScopeMixin implements IToc {
  final int identifier;

  late final IsolateTaskManager _taskManager;
  late final SharedValueManager _sharedValueManager;

  new({required this.identifier, required SendPort sender}) {
    _taskManager = heart.attachChild(
      IsolateTaskManager(
        currentIsolateID: identifier,
        zoneValues: {
          Toc.kTocSymbol: this,
        },
      ),
    );
    _taskManager.connectChannel(port: sender, initID: 0).$;

    if (identifier == 1) {
      _sharedValueManager = heart.attachChild<SharedValueInstance>(SharedValueInstance());
    } else {
      _sharedValueManager = heart.attachChild<SharedValueReference>(SharedValueReference(taskManager: _taskManager));
    }
  }

  @override
  FutureResult<T> execute<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function}) async {
    checkDisposed().$;
    if (_taskManager.taskCount <= 1) {
      return await function(parameters);
    }

    return await _taskManager.addNewTask(
      threadID: 0,
      parameters: InvocationParameters.addParameters(original: parameters, namedParameters: {'%&#funk': function}),
      function: _invokeToThreadServer<T>,
    );
  }

  static FutureResult<T> _invokeToThreadServer<T>(InvocationParameters parameters) => futureScope(() {
    final function = parameters.namedParameters['%&#funk'] as FutureResultOr<T> Function(InvocationParameters);
    final mainInstance = Toc.getTocZone().$;
    return mainInstance.execute(function: function, parameters: parameters);
  });

  @override
  void performDisposal() {
    super.performDisposal();

    Future.delayed(const Duration(milliseconds: 20)).then((_) {
      Isolate.exit();
    });
  }

  @override
  FutureResult<T> getSharedValue<T>(String name) {
    return _sharedValueManager.getSharedValue<T>(name);
  }

  @override
  Future<Result<R>> invokeSharedValue<T, R>(String name, FutureOr<Result<R>> Function(T) callback) {
    return _sharedValueManager.invokeSharedValue<T, R>(name, callback);
  }

  @override
  Future<Result<void>> setSharedOperatorValue<T extends Disposable>(String name, T value, [bool disposePrevious = false]) {
    return _sharedValueManager.setSharedOperatorValue<T>(name, value, disposePrevious);
  }

  @override
  FutureResult<void> setSharedValue<T>(String name, T value) {
    return _sharedValueManager.setSharedValue<T>(name, value);
  }
}
