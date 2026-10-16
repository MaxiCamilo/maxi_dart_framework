import 'dart:async';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_end_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_start_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task_manager.dart';

class ClientIsolateInstance with DisposableMixin, WithLifecycleScopeMixin implements IToc {
  final int identifier;

  late final IsolateTaskManager _taskManager;

  @override
  bool get isMainThread => false;

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
  Future<Result<Channel<R, S>>> connectToSharedValue<R, S>(Channel<R, S> channel) => futureScopeValue(() async {
    checkDisposed().$;

    final startChannelPoint = heart.attachChild(
      IsolateStartChannelPoint<R, S>(channel: channel),
    );

    final sender = startChannelPoint.getSenderPoint().$;

    return IsolateEndChannelPoint<R, S>(port: sender);
  });

  @override
  FutureResult<T> executeOnManager<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(MainTocValueManager, InvocationParameters) function}) {
    return _taskManager.addNewTask(
      threadID: 0,
      parameters: InvocationParameters.addParameters(original: parameters, namedParameters: {'%&#funk2': function}),
      function: _invokeToThreadServerValues<T>,
    );
  }

  static FutureResult<T> _invokeToThreadServerValues<T>(InvocationParameters parameters) => futureScope(() async {
    final function = parameters.namedParameters['%&#funk2'] as FutureResultOr<T> Function(MainTocValueManager, InvocationParameters);
    final mainInstance = Toc.getTocZone().$;
    return mainInstance.executeOnManager(function: function, parameters: parameters);
  });
}
