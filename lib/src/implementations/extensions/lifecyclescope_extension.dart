import 'dart:async';
import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:rxdart/rxdart.dart';

extension LifecycleScopeExtension on ILifecycleScope {
  T attachChild<T extends Disposable>(T child, [Function(T)? onDispose]) {
    if (isDisposed) {
      log('LifecycleScope is already disposed. The child will also be disposed');
      child.dispose();
      return child;
    }

    if (child is DisposableMixin && child.isDisposed) {
      log('Child is already disposed. Skipping attachment');
      return child;
    }

    attach(
      value: child,
      function: (c) {
        c.dispose();
        if (onDispose != null) {
          onDispose(c);
        }
      },
    ).$;

    return child;
  }

  StreamController<T> attachStreamController<T>(StreamController<T> controller) {
    if (controller.isClosed) {
      log('StreamController is already closed. Skipping attachment');
      return controller;
    }

    if (isDisposed) {
      log('LifecycleScope is already disposed. Closing StreamController immediately');
      controller.close();
      return controller;
    }

    final entry = attach(value: controller, function: (c) => c.close()).$;
    controller.onCancel = entry.dispose;

    return controller;
  }

  Result<StreamSubscription<T>> attachStream<T>({required Stream<T> stream, required void Function(T) onData, Function? onError, void Function()? onDone}) => resultScope(() {
    if (isDisposed) {
      return Result.error('LifecycleScope is already disposed. Stream will not be attached');
    }

    late Disposable entry;
    final subscription = volatileScope(
      message: const Oration('Failed to listen to the stream'),
      function: () => stream
          .doOnCancel(entry.dispose)
          .listen(
            onData,
            onError: onError,
            onDone: () {
              entry.dispose();
              if (onDone != null) {
                onDone();
              }
            },
          ),
    ).$;

    entry = attach(value: subscription, function: (s) => s.cancel()).$;

    return ResultValue(subscription);
  });

  Result<void> attachStreamSubscription(StreamSubscription subscription) => resultScope(() {
    if (isDisposed) {
      return Result.error('LifecycleScope is already disposed. StreamSubscription will not be attached');
    }

    attach(value: subscription, function: (s) => s.cancel()).$;

    return voidResult;
  });

  Disposable onDispose(void Function() func) {
    if (isDisposed) {
      log('LifecycleScope is already disposed. Executing onDispose immediately');
      func();
      return this;
    }

    final onDispose = _OnDispose(func: func);
    attach(value: onDispose, function: (d) => d.execute).$;
    return onDispose;
  }

  Future<void> waitDisposed() async {
    if (isDisposed) return;
    final completer = Completer();
    onDispose(() {
      completer.complete();
    });
    return completer.future;
  }
}

class _OnDispose with DisposableMixin {
  final void Function() func;
  bool _canceled = false;

  _OnDispose({required this.func});

  void execute() {
    if (_canceled) {
      return;
    }

    func();
    dispose();
  }

  @override
  void performDisposal() {
    _canceled = true;
  }
}
