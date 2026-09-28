import 'dart:async';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task_manager.dart';
import 'package:maxi_dart_framework/src/threads/toc/main_isolate_instance.dart';

extension IsolateTaskManagerExtension on IsolateTaskManager {
  FutureResult<IsolateChannelPoint> obtainThreadChannel(int threadID) => futureScope(() async {
    final existsChannel = tryGetChannel(threadID);
    if (existsChannel != null) {
      return Result.value(existsChannel);
    }

    if (currentIsolateID == 0) {
      return Result.error('Cannot obtain thread channel for the main isolate');
    }

    final (port, channel) = buildPort().$;
    await addNewTask(threadID: 0, parameters: InvocationParameters.list([port, threadID]), function: _searchThreadByID).$;

    return Result.value(tryGetChannel(threadID)!);
  });

  static Future<Result<void>> _searchThreadByID(InvocationParameters parameter) => futureScope(() {
    final port = parameter.first<SendPort>().$;
    final threadID = parameter.second<int>().$;

    Toc.getTocZone().map((x) => x as MainIsolateInstance).$.taskManager.connectChannel(port: port, initID: threadID).$;
    return Result.ok;
  });
}
