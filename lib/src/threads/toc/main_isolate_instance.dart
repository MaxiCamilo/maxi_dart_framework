import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task_manager.dart';
import 'package:maxi_dart_framework/src/threads/toc/client_isolate_instance.dart';
import 'package:meta/meta.dart';

class _ClientPoints with DisposableMixin {
  final IsolateChannelPoint channel;
  int taskCount = 0;

  new({required this.channel});

  @override
  void performDisposal() => channel.dispose();
}

class MainIsolateInstance with DisposableMixin, WithLifecycleScopeMixin, AsynchronousInitializationMixin implements IToc {
  late final DisposableLinkedList<_ClientPoints> _asynchronousThreads;
  late final IsolateChannelPoint _sharedValuesThread;

  late final IsolateTaskManager _taskManager;

  @internal
  IsolateTaskManager get taskManager => _taskManager;

  @override
  FutureResult<void> performInitialization() => futureScope(() async {
    _taskManager = heart.attachChild(IsolateTaskManager(currentIsolateID: 0, zoneValues: {Toc.kTocSymbol: this}));
    _asynchronousThreads = heart.attachChild(DisposableLinkedList<_ClientPoints>());

    final (sharedPort, sharedChannel) = _taskManager.buildPort().$;
    await Isolate.spawn<(int, SendPort)>(_startThread, (1, sharedPort));
    await sharedChannel.waitInit();
    _sharedValuesThread = sharedChannel;
    //_asynchronousThreads.addLast(sharedChannel);

    for (int i = 0; i < Platform.numberOfProcessors; i++) {
      final (sharedPort, sharedChannel) = _taskManager.buildPort().$;
      await Isolate.spawn<(int, SendPort)>(_startThread, (i + 2, sharedPort));
      await sharedChannel.waitInit();
      _asynchronousThreads.addLast(_ClientPoints(channel: sharedChannel));
    }

    return Result.ok;
  });

  static void _startThread((int identifier, SendPort sendPort) args) {
    final identifier = args.$1;
    final sendPort = args.$2;

    Toc.kInstance = ClientIsolateInstance(identifier: identifier, sender: sendPort);
  }

  @override
  FutureResult<T> execute<T>({InvocationParameters parameters = InvocationParameters.empty, required FutureResultOr<T> Function(InvocationParameters) function}) async {
    checkDisposed().$;
    initialize().$;

    final selectedThread = _asynchronousThreads.minimumOf((x) => x.taskCount);
    selectedThread.taskCount += 1;
    try {
      return await _taskManager.addNewTask(threadID: selectedThread.channel.isolateId, parameters: parameters, function: function);
    } finally {
      selectedThread.taskCount -= 1;
    }
  }

  @override
  FutureResult<T> getSharedValue<T>(String name) async {
    checkDisposed().$;
    initialize().$;

    
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
