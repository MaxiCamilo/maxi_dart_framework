import 'dart:async';
import 'dart:developer';
import 'dart:isolate';
import 'dart:math' show Random;

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_request.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task.dart';
import 'package:rxdart/rxdart.dart';

class IsolateTaskManager with DisposableMixin, WithLifecycleScopeMixin {
  final int currentIsolateID;
  final Map<dynamic, dynamic> zoneValues;

  late final DisposableLinkedList<IsolateChannelPoint> _channels = heart.attachChild(DisposableLinkedList<IsolateChannelPoint>());
  late final DisposableLinkedList<IsolateTask> _tasks = heart.attachChild(DisposableLinkedList<IsolateTask>());
  late final DisposableLinkedList<IsolateRequest> _request = heart.attachChild(DisposableLinkedList<IsolateRequest>());

  int get taskCount => _tasks.length;

  int _nextTaskID = 0;

  new({required this.currentIsolateID, required this.zoneValues});

  IsolateChannelPoint? tryGetChannel(int id) => _channels.select((x) => x.isolateId == id);

  FutureResult<T> addNewTask<T>({
    required int threadID,
    required InvocationParameters parameters,
    required FutureOr<Result<T>> Function(InvocationParameters) function,
  }) => futureScope(() async {
    checkDisposed().$;

    final connector = _channels.select((x) => x.isolateId == threadID);
    if (connector == null) {
      return Result.error('No connector found for threadID %s', [threadID.toString()]);
    }

    final uniqueID = (currentIsolateID * 10000) + _nextTaskID + function.hashCode + parameters.hashCode + Random().nextInt(10000);
    final pack = IsolateExecutorNewTask<T>(function: function, parameters: parameters, uniqueID: uniqueID);
    final request = IsolateRequest<T>(channel: connector, uniqueID: uniqueID);
    _request.attachLast(request);

    connector.sendItem(pack).$;

    return request.waitResult();
  });

  Result<(SendPort, InitIsolateChannelPoint)> buildPort() => resultScope(() {
    checkDisposed().$;
    final newChannel = InitIsolateChannelPoint();
    _channels.attachLast(newChannel);

    newChannel.waitInit().whenComplete(() {
      final exists = _channels.select((x) => x.isolateId == newChannel.isolateId);
      if (exists == null) {
        _channels.addLast(newChannel);
        newChannel.getReceiver().$.whereType<IsolateExecutorMessage>().listen((data) => _processMessage(newChannel, data));
      } else {
        log('Channel for isolateId ${newChannel.isolateId} already exists. Disposing the new channel.');
        newChannel.dispose();
      }
    });

    return Result.value((newChannel.sendPort, newChannel));
  });

  Result<IsolateChannelPoint> connectChannel({required SendPort port, required int initID}) => resultScope(() {
    checkDisposed().$;

    final exists = _channels.select((x) => x.isolateId == initID);
    if (exists != null) {
      return Result.error('Channel for isolateId %s already exists', [initID.toString()]);
    }

    final newChannel = EndIsolateChannelPoint(currentID: currentIsolateID, initID: initID, initSendPort: port);

    _channels.attachLast(newChannel);
    newChannel.getReceiver().$.whereType<IsolateExecutorMessage>().listen((data) => _processMessage(newChannel, data));

    return Result.value(newChannel);
  });

  void _processMessage(IsolateChannelPoint channel, IsolateExecutorMessage data) {
    if (isDisposed) {
      return;
    }

    if (data is IsolateExecutorNewTaskResult) {
      _processNewTaskResult(data);
    } else if (data is IsolateExecutorCompletedTask) {
      _processCompletedTask(data);
    } else if (data is IsolateExecutorNewTask) {
      _buildNewTask(channel, data);
    } else if (data is IsolateExecutorCancelledTask) {
      _processCancelledTask(data);
    } else if (data is IsolateExecutorInteractiveItem) {
      _processInteractiveItem(data);
    } else {
      log('Received unknown message type: ${data.runtimeType}');
    }
  }

  void _processNewTaskResult(IsolateExecutorNewTaskResult data) {
    final request = _request.select((x) => x.uniqueID == data.uniqueID);
    if (request == null) {
      log('New task result received but no matching request was found');
      return;
    }

    if (data.result is ResultFailure) {
      log('New task result received with failure: ${data.result}');
      request.dispose();
      return;
    }

    request.confirmExecution(data.taskID);
  }

  void _processCompletedTask(IsolateExecutorCompletedTask data) {
    final request = _request.select((x) => x.taskID == data.taskID);
    if (request == null) {
      log('Completed task received but no matching request was found');
      return;
    }
    request.defineResult(data.result).logIfFailure('Failed to define result for completed task with ID %', [data.taskID.toString()]);
  }

  void _processCancelledTask(IsolateExecutorCancelledTask data) {
    final request = _request.select((x) => x.taskID == data.taskID);
    if (request == null) {
      return;
    }
    request.dispose();
  }

  void _processInteractiveItem(IsolateExecutorInteractiveItem data) {
    final request = _request.select((x) => x.taskID == data.taskID);
    if (request == null) {
      return;
    }
    request.addInteractiveItem(data.item);
  }

  void _buildNewTask(IsolateChannelPoint channel, IsolateExecutorNewTask data) {
    final id = _nextTaskID;
    _nextTaskID += 1;
    final task = data.buildTask(channel, id, zoneValues, currentIsolateID);
    _tasks.addLast(task);

    final runResult = task.run();
    if (runResult is ResultFailure) {
      log('Task run failed: $runResult');
      task.dispose();
    }
  }
}
