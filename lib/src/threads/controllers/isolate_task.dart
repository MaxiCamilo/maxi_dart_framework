import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/toc/interactive_system.dart';

abstract interface class IsolateExecutorMessage {}

class IsolateExecutorNewTaskResult implements IsolateExecutorMessage {
  final int uniqueID;
  final int taskID;
  final Result<void> result;

  new({required this.uniqueID, required this.taskID, required this.result});
}

class IsolateExecutorCompletedTask<T> implements IsolateExecutorMessage {
  final int taskID;
  final Result<T> result;

  const new({required this.taskID, required this.result});
}

class IsolateExecutorInteractiveItem<T> implements IsolateExecutorMessage {
  final int taskID;
  final T item;

  const new({required this.taskID, required this.item});
}

class IsolateExecutorCancelledTask implements IsolateExecutorMessage {
  final int taskID;

  const new({required this.taskID});
}

class IsolateExecutorNewTask<T> implements IsolateExecutorMessage {
  final int uniqueID;
  final InvocationParameters parameters;
  final FutureOr<Result<T>> Function(InvocationParameters) function;

  const new({required this.uniqueID, required this.parameters, required this.function});

  IsolateTask<T> buildTask(IsolateChannelPoint channel, int taskID, Map zoneValues, int currentThreadID) {
    return IsolateTask<T>(
      channel: channel,
      uniqueID: uniqueID,
      taskID: taskID,
      parameters: parameters,
      function: function,
      zoneValues: zoneValues,
      currentThreadID: currentThreadID,
    );
  }
}

class IsolateTask<T> with DisposableMixin, WithLifecycleScopeMixin {
  final IsolateChannelPoint channel;
  final int taskID;
  final int currentThreadID;
  final int uniqueID;
  final InvocationParameters parameters;
  final FutureOr<Result<T>> Function(InvocationParameters) function;
  final Map zoneValues;

  bool isRunning = false;

  late final MasterChannel interactiveChannel;

  new({required this.uniqueID, required this.channel, required this.taskID, required this.parameters, required this.function, required this.zoneValues, required this.currentThreadID});

  Result<void> run() => resultScopeVoid(() {
    if (isRunning) return;
    isRunning = true;

    final newTask = IsolateExecutorNewTaskResult(taskID: taskID, uniqueID: uniqueID, result: Result.ok);
    channel.sendItem(newTask).$;

    interactiveChannel = heart.attachChild(MasterChannel());
    interactiveChannel.getReceiver().$.listen((x) {
      channel.sendItem(IsolateExecutorInteractiveItem<T>(taskID: taskID, item: x)).logIfFailure('Interactive item received');
    });

    final childChannel = interactiveChannel.buildFollowerChannel().$;

    final child = Zone.current.fork(
      zoneValues: {
        Interactive.interactiveChannelKey: childChannel,
        TaskZone.kInteractiveSymbolName: heart,
        Toc.kIsolateThreadRequestID: channel.isolateId,
        Toc.kIsolateCurrentThreadID: currentThreadID,
        ...zoneValues,
      },
    );

    child.run(() async {
      try {
        final result = await function(parameters);
        channel.sendItem(IsolateExecutorCompletedTask<T>(taskID: taskID, result: result)).$;
      } catch (ex, st) {
        final exError = ExceptionResult<T>(exception: ex, stackTrace: st, message: Oration("An unexpected error occurred %", [ex.toString()]));

        channel.sendItem(IsolateExecutorCompletedTask<T>(taskID: taskID, result: exError)).logIfFailure('Isolate exception');
      } finally {
        dispose();
      }
    });
  });

  Result<void> insertInteractiveItem(dynamic item) => resultScopeVoid(() {
    checkDisposed().$;
    interactiveChannel.sendItem(item).logIfFailure('Interactive item inserted');
  });
}
