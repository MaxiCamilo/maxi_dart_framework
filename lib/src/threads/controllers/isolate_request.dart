import 'dart:async';
import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/channels/isolate_channel_point.dart';
import 'package:maxi_dart_framework/src/threads/controllers/isolate_executor.dart';
import 'package:maxi_dart_framework/src/threads/toc/interactive_system.dart';

class IsolateRequest<T> with DisposableMixin, WithLifecycleScopeMixin implements TaskInstance<T> {
  final int taskID;
  final IsolateChannelPoint channel;

  final _completer = Completer<Result<T>>();

  StreamController<dynamic>? _interactiveController;

  IsolateRequest({required this.taskID, required this.channel});

  @override
  FutureResult<T> waitResult() => futureScope(() async {
    if (_completer.isCompleted) return await _completer.future;

    if (Interactive.hasInteractiveChannel) {
      heart.attachStreamSubscription(Interactive.getReceive().$.listen((x) => channel.sendItem(IsolateExecutorInteractiveItem(taskID: taskID, item: x))));
      _interactiveController ??= heart.attachStreamController(StreamController<dynamic>.broadcast());
    }

    heart.onDispose(() {
      if (!_completer.isCompleted) {
        _completer.complete(Result.error('Request was disposed before result was defined'));
      }
    });

    return await _completer.future;
  });

  Result<void> defineResult(Result result) => resultScope(() {
    if (_completer.isCompleted) {
      return Result.error('Result has already been defined for this request');
    }

    checkDisposed().$;

    if (result is ResultValue) {
      final value = result.value;
      if (value is T) {
        _completer.complete(Result.value(value));
      } else {
        _completer.complete(Result.error('Result value type does not match the expected type'));
      }
    } else if (result is ResultFailure) {
      _completer.complete(result.cast<T>());
    } else {
      _completer.complete(Result.error('Unknown result type'));
    }

    dispose();

    return Result.ok;
  });

  Result<void> addInteractiveItem(dynamic item) => resultScope(() {
    if (isDisposed) {
      log('Attempted to add interactive item after request was disposed');
      return Result.ok;
    }

    if (_interactiveController == null) {
      return Result.ok;
    }

    _interactiveController!.add(item);

    return Result.ok;
  });
}
