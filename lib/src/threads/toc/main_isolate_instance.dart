import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_end_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_start_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_task_manager.dart';
import 'package:maxi_dart_framework/src/threads/shared/isolate/real_isolate_toc_value_manager.dart';
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

  late final IsolateTaskManager _taskManager;

  late final MainTocValueManager _mainTocManager;

  @internal
  IsolateTaskManager get taskManager => _taskManager;

  @override
  bool get isMainThread => true;

  final List<Isolate> _isolates = [];

  @override
  FutureResult<void> performInitialization() => futureScope(() async {
    if (isAndroidPlatform && !Toc.androidConfirmThreadWarning) {
      print('FATAL FAILURE: An Android instance is running without a thread canceller attached. When the thread becomes unavailable, use “InitMaxiFlutterApp”');
      exit(1);
    }

    _taskManager = heart.attachChild(IsolateTaskManager(currentIsolateID: 0, zoneValues: {Toc.kTocSymbol: this}));
    _asynchronousThreads = heart.attachChild(DisposableLinkedList<_ClientPoints>());
    _mainTocManager = heart.attachChild<RealIsolateTocValueManager>(RealIsolateTocValueManager());

    final (sharedPort, sharedChannel) = _taskManager.buildPort().$;
    _isolates.add(await Isolate.spawn<(int, SendPort)>(_startThread, (1, sharedPort), debugName: 'Thread 1: Shared Values'));
    await sharedChannel.waitInit();
    //_asynchronousThreads.addLast(sharedChannel);

    for (int i = 0; i < Platform.numberOfProcessors; i++) {
      final (sharedPort, sharedChannel) = _taskManager.buildPort().$;
      final isolate = await Isolate.spawn<(int, SendPort)>(_startThread, (i + 2, sharedPort), debugName: 'Thread ${i + 2}: Task Processor');
      await sharedChannel.waitInit();
      _asynchronousThreads.addLast(_ClientPoints(channel: sharedChannel));
      _isolates.add(isolate);
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
    await $$_(initialize());

    final selectedThread = _asynchronousThreads.minimumOf((x) => x.taskCount);
    selectedThread.taskCount += 1;
    try {
      return await _taskManager.addNewTask(threadID: selectedThread.channel.isolateId, parameters: parameters, function: function);
    } finally {
      selectedThread.taskCount -= 1;
    }
  }

  @override
  Future<Result<Channel<R, S>>> connectToSharedValue<R, S>(Channel<R, S> channel) => futureScopeValue(() async {
    checkDisposed().$;
    await $$_(initialize());

    final startChannelPoint = heart.attachChild(
      IsolateStartChannelPoint<R, S>(channel: channel),
    );

    final sender = startChannelPoint.getSenderPoint().$;

    return IsolateEndChannelPoint<R, S>(port: sender);
  });

  @override
  FutureResult<T> executeOnManager<T>({InvocationParameters parameters = InvocationParameters.empty, required function}) => futureScope(() async {
    checkDisposed().$;
    await $$_(initialize());

    return await function(_mainTocManager, parameters);
  });

  @override
  void performDisposal() {
    super.performDisposal();

    for (var isolate in _isolates) {
      isolate.kill(priority: Isolate.beforeNextEvent);
    }

    _isolates.clear();
  }
}
