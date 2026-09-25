import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/toc/interactive_system.dart';

mixin TaskZone {
  static const kInteractiveSymbolName = #maxiInteractive;

  static bool get hasZoneHeart => Zone.current[kInteractiveSymbolName] != null;
  static bool get isZoneHeartCanceled => Zone.current[kInteractiveSymbolName] != null && (Zone.current[kInteractiveSymbolName] as LifecycleScope).isDisposed;

  static LifecycleScope? tryGetZoneHeart() => Zone.current[kInteractiveSymbolName] as LifecycleScope?;

  static Result<LifecycleScope> getHeart() {
    final heart = tryGetZoneHeart();
    if (heart == null) {
      return Result.error("No heart found in the current zone");
    }
    if (heart.isDisposed) {
      return Result.error("Heart is disposed");
    }
    return Result.value(heart);
  }

  static Result<void> checkCancelation() {
    if (isZoneHeartCanceled) {
      return CancelationResult();
    }
    return Result.ok;
  }

  static TaskInstance<T> createTask<T>({Map<Object?, Object?> zoneValues = const {}, required FutureOr<Result<T>> Function() body, bool attach = true}) {
    return _TaskZoneInstance<T>(attach: attach, function: body, zoneValues: zoneValues, rootHeart: tryGetZoneHeart());
  }

  static FutureResult<T> run<T>({
    Map<Object?, Object?> zoneValues = const {},
    required FutureOr<Result<T>> Function() body,
    bool attach = true,
    Function(TaskInstance<T>)? onTaskCreate,
    Function(LifecycleScope)? onHeartCreate,
  }) {
    final task = _TaskZoneInstance<T>(attach: attach, function: body, zoneValues: zoneValues, rootHeart: tryGetZoneHeart());
    if (onTaskCreate != null) {
      onTaskCreate(task);
    }

    return task.waitResult(onHeartCreate);
  }
}

class _TaskZoneInstance<T> with DisposableMixin implements TaskInstance<T> {
  final LifecycleScope? rootHeart;
  final Map<Object?, Object?> zoneValues;
  final FutureOr<Result<T>> Function() function;
  final bool attach;

  Completer<Result<T>>? completer;

  _TaskZoneInstance({required this.rootHeart, required this.zoneValues, required this.function, required this.attach});

  @override
  void performDisposal() {
    completer ??= Completer<Result<T>>();
    if (completer?.isCompleted == false) {
      completer?.complete(CancelationResult());
    }
  }

  @override
  FutureResult<T> waitResult([Function(LifecycleScope)? onHeartCreate]) async {
    if (completer != null) return completer!.future;

    if (!attach || rootHeart == null) {
      final scope = LifecycleScope();
      if (onHeartCreate != null) {
        onHeartCreate(scope);
      }

      return _run(scope);
    }

    if (rootHeart!.isDisposed) {
      return CancelationResult();
    }

    final childLife = LifecycleScope();
    rootHeart!.attachChild(childLife);
    if (onHeartCreate != null) {
      onHeartCreate(childLife);
    }

    return _run(childLife);
  }

  FutureResult<T> _run(LifecycleScope heart) {
    completer = Completer<Result<T>>();
    heart.attachChild(this);

    final child = Zone.current.fork(
      zoneValues: {...zoneValues, TaskZone.kInteractiveSymbolName: heart, Interactive.interactiveChannelKey: heart.attachChild(BroadcastChannel())},
    );
    return child.run(() async {
      late Result<T> itemResult;
      try {
        itemResult = await function();
      } catch (ex, st) {
        itemResult = ExceptionResult(exception: ex, stackTrace: st, message: Oration("An unexpected error occurred %", [ex.toString()]));
      } finally {
        if (completer?.isCompleted == false) {
          completer?.complete(itemResult);
        }
        heart.dispose();
      }

      return itemResult;
    });
  }
}
