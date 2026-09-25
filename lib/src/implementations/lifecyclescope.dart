import 'dart:collection';
import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:meta/meta.dart';

abstract interface class ILifecycleScope implements DisposableMixin {
  Result<Disposable> attach<T>({required T value, required void Function(T) function});
}

abstract interface class WithLifecycleScope {
  LifecycleScope get heart;

  void disposeHeart();
}

mixin WithLifecycleScopeMixin on DisposableMixin implements WithLifecycleScope {
  LifecycleScope? _lifecycleScope;

  @override
  LifecycleScope get heart {
    if (_lifecycleScope == null) {
      _lifecycleScope = LifecycleScope();
      if (isDisposed) {
        log('LifecycleScope was created after the parent was disposed. Disposing it immediately.');
        _lifecycleScope!.dispose();
      }
    }

    return _lifecycleScope!;
  }

  @override
  @mustCallSuper
  void performDisposal() {
    _lifecycleScope?.dispose();
    _lifecycleScope = null;
  }

  @override
  void disposeHeart(){
    _lifecycleScope?.dispose();
    _lifecycleScope = null;
  }
}

mixin DelegateLifetime implements DisposableMixin, WithLifecycleScope {
  @override
  void disposeHeart() {
    heart.dispose();
  }
  @override
  bool get isDisposed => heart.isDisposed;

  @override
  @internal
  @sealed
  @protected
  void performDisposal() {}

  @override
  void dispose() {
    if (heart.isDisposed) return;
    heart.dispose();
    performDisposal();
  }
}

final class LifecycleScope with DisposableMixin implements ILifecycleScope {
  final LinkedList<_LifecycleScopeEntry> _entries = LinkedList<_LifecycleScopeEntry>();

  @override
  Result<Disposable> attach<T>({required T value, required void Function(T) function}) {
    if (isDisposed) {
      log('LifecycleScope is already disposed. Executing function immediately');
      function(value);
      return Result.error('LifecycleScope is already disposed');
    } else {
      final entry = _LifecycleScopeEntry<T>(value: value, function: function);
      _entries.add(entry);
      return Result.value(entry);
    }
  }

  @override
  void performDisposal() {
    for (final entry in _entries) {
      entry.dispose();
    }
    _entries.clear();
  }
}

final class _LifecycleScopeEntry<T> extends LinkedListEntry<_LifecycleScopeEntry> with DisposableMixin {
  final T value;
  final void Function(T) function;

  _LifecycleScopeEntry({required this.value, required this.function});

  @override
  void performDisposal() {
    try {
      function(value);
    } catch (e) {
      log('Error occurred while executing disposal function: $e');
    }

    unlink();
  }
}

final class LifecycleScopeFactory implements ILifecycleScope {
  @override
  bool isDisposed = false;

  LifecycleScope? _lifecycleScope;

  @override
  Result<Disposable> attach<T>({required T value, required void Function(T) function}) {
    _lifecycleScope ??= LifecycleScope();
    return _lifecycleScope!.attach(value: value, function: function);
  }

  @override
  void dispose() {
    if (isDisposed) return;
    isDisposed = true;
    performDisposal();
  }

  @override
  void performDisposal() {
    _lifecycleScope?.dispose();
    _lifecycleScope = null;
  }
}
