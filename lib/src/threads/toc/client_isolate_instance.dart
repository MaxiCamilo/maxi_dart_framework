import 'dart:async';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task_manager.dart';

class ClientIsolateInstance with DisposableMixin, WithLifecycleScopeMixin implements IToc {
  final int identifier;

  late final IsolateTaskManager _taskManager;

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
    // TODO: implement getSharedValue
    throw UnimplementedError();
  }

  @override
  Future<Result<R>> invokeSharedValue<T, R>(String name, FutureOr<Result<R>> Function(T) callback) {
    // TODO: implement invokeSharedValue
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> setSharedOperatorValue<T extends Disposable>(String name, T value, [bool disposePrevious = false]) {
    // TODO: implement setSharedOperatorValue
    throw UnimplementedError();
  }

  @override
  FutureResult<void> setSharedValue<T>(String name, T value) {
    // TODO: implement setSharedValue
    throw UnimplementedError();
  }
}
