import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/threads/toc/shared/shared_value_manager.dart';

class _SharedOperatorInstance implements Disposable {
  final String name;
  final Disposable value;

  new({required this.name, required this.value}) {
    if (value is WithLifecycleScope) {
      (value as WithLifecycleScope).heart.onDispose(() => dispose());
    }
  }

  @override
  void dispose() {
    value.dispose();
  }
}

class SharedValueInstance with DisposableMixin, WithLifecycleScopeMixin implements SharedValueManager {
  late final DisposableLinkedList<_SharedOperatorInstance> _sharedOperators = heart.attachChild(DisposableLinkedList<_SharedOperatorInstance>());
  late final Map<String, dynamic> _sharedValues = {};

  @override
  FutureResult<T> getSharedValue<T>(String name) async {
    final value = _sharedValues[name];
    if (value == null) {
      return Result.error('Shared value not found for name: %', [name]);
    }

    if (value is T) {
      return Result.value(value);
    } else {
      return Result.error('Shared value is not of expected type for name: %', [name]);
    }
  }

  @override
  FutureResult<void> setSharedValue<T>(String name, T value) async {
    _sharedValues[name] = value;
    return Result.ok;
  }

  @override
  Future<Result<R>> invokeSharedValue<T, R>(String name, FutureOr<Result<R>> Function(T) callback) async {
    final instance = _sharedOperators.select((op) => op.name == name);
    if (instance == null) {
      return Result.error('Shared operator instance not found for name: %', [name]);
    }
    if (instance.value is T) {
      return await callback(instance.value as T);
    } else {
      return Result.error('Shared operator instance is not of expected type for name: %', [name]);
    }
  }

  @override
  Future<Result<void>> setSharedOperatorValue<T extends Disposable>(String name, T value, [bool disposePrevious = false]) async {
    final instance = _sharedOperators.select((op) => op.name == name);
    if (instance != null) {
      if (disposePrevious) {
        _sharedOperators.remove(instance);
      } else {
        return Result.error('Shared operator instance already exists for name: %', [name]);
      }
    }

    _sharedOperators.addLast(_SharedOperatorInstance(name: name, value: value));
    return Result.ok;
  }
}
