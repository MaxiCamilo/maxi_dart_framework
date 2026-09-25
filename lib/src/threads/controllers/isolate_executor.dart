import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/toc/interactive_system.dart';

class IsolateExecutorNewTask {
  final int taskID;

  new({required this.taskID});
}

class IsolateExecutorCompletedTask<T> {
  final int taskID;
  final Result<T> result;

  const new({required this.taskID, required this.result});
}

class IsolateExecutorInteractiveItem<T> {
  final int taskID;
  final T item;

  const new({required this.taskID, required this.item});
}

class IsolateExecutorCancelledTask {
  final int taskID;

  const new({required this.taskID});
}

class IsolateExecutorMessage<T> {
  final InvocationParameters parameters;
  final FutureResult<T> Function(InvocationParameters) function;

  const new({required this.parameters, required this.function});

  IsolateExecutor<T> buildExecutor(IsolateChannelPoint channel, int taskID) {
    return IsolateExecutor<T>(
      channel: channel,
      taskID: taskID,
      parameters: parameters,
      function: function,
    );
  }
}

class IsolateExecutor<T> with DisposableMixin, WithLifecycleScopeMixin {
  final IsolateChannelPoint channel;
  final int taskID;
  final InvocationParameters parameters;
  final FutureResult<T> Function(InvocationParameters) function;

  bool isRunning = false;

  late final MasterChannel interactiveChannel;

  new({required this.channel, required this.taskID, required this.parameters, required this.function});

  Result<void> run() => resultScopeVoid(() {
    if (isRunning) return;
    isRunning = true;

    final newTask = IsolateExecutorNewTask(taskID: taskID);
    channel.sendItem(newTask).$;

    interactiveChannel = heart.attachChild(MasterChannel());
    interactiveChannel.getReceiver().$.listen((x) {
      channel.sendItem(IsolateExecutorInteractiveItem<T>(taskID: taskID, item: x)).logIfFailure('Interactive item received');
    });

    final childChannel = interactiveChannel.buildFollowerChannel().$;

    final child = Zone.current.fork(
      zoneValues: {Interactive.interactiveChannelKey: childChannel, TaskZone.kInteractiveSymbolName: heart},
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
