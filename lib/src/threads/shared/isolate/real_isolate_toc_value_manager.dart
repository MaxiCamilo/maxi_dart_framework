import 'dart:async';
import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class RealIsolateTocValueManager with DisposableMixin, WithLifecycleScopeMixin implements MainTocValueManager {
  late final Map<String, dynamic> _sharedValues = {};
  late final DisposableLinkedList _sharedOperators = heart.attachChild(DisposableLinkedList());
  late final StreamController<(String, dynamic)> _sharedValueChanges = heart.attachStreamController(StreamController.broadcast());

  @override
  FutureResult<bool> hasSharedValue<T>(String name) => futureScope(() {
    if (!_sharedValues.containsKey(name)) {
      return Result.value(false);
    }

    final value = _sharedValues[name];
    if (value is! T) {
      return Result.error('Type mismatch for shared value with name ? (expected ? but got ?)', [name, T.toString(), value.runtimeType.toString()]);
    }

    return Result.value(true);
  });

  @override
  FutureResult<T> getSharedValue<T>(String name, [T? defaultValue]) => futureScope(() async {
    final shared = _sharedValues[name];
    if (shared == null) {
      if (defaultValue == null) {
        return Result.error('No shared value with name ? found', [name]);
      } else {
        _sharedValues[name] = defaultValue;
        _sharedValueChanges.add((name, defaultValue));
        return Result.value(defaultValue);
      }
    }

    if (shared is! T) {
      return Result.error('Type mismatch for shared value with name ? (expected ? but got ?)', [name, T.toString(), shared.runtimeType.toString()]);
    }

    return Result.value(shared);
  });

  @override
  FutureResult<void> setSharedValue<T>(String name, T value) => futureScope(() async {
    final previous = _sharedValues[name];
    _sharedValues[name] = value;

    if (previous != null && previous is Disposable) {
      previous.dispose();
    }

    _sharedValueChanges.add((name, value));

    return Result.ok;
  });

  Result<T?> _selectOperator<T extends Disposable>() => resultScopeValue(() {
    T? item = _sharedOperators.select((element) => element.runtimeType == T) as T?;
    if (item == null) {
      item = _sharedOperators.select((element) => element.runtimeType is T) as T?;
      return item;
    }

    return item;
  });

  @override
  FutureResult<void> setSharedOperator<T extends Disposable>(T value, [bool disposePrevious = false]) => futureScope(() async {
    final shared = _selectOperator<T>().$;
    if (shared != null) {
      if (disposePrevious) {
        shared.dispose();
      } else {
        return Result.error('Shared operator of type ? already exists', [T.toString()]);
      }
    }

    _sharedOperators.addLast(value);
    return Result.ok;
  });

  @override
  FutureResult<R> invokeSharedOperator<T extends Disposable, R>(InvocationParameters parameters, Future<Result<R>> Function(T, InvocationParameters parameters) callback) => futureScope(() async {
    final shared = _selectOperator<T>().$;
    if (shared == null) {
      return Result.error('No shared operator of type ? found', [T.toString()]);
    }

    return await callback(shared, parameters);
  });

  @override
  FutureResult<bool> hasSharedOperator<T extends Disposable>() => futureScope(() {
    return Result.value(_sharedOperators.any((element) => element is T));
  });

  @override
  FutureResult<R> invokeSharedValue<T, R>(String name, InvocationParameters parameters, FutureOr<Result<R>> Function(T, InvocationParameters parameters) callback) => futureScope(() async {
    final shared = _sharedValues[name];
    if (shared == null) {
      return Result.error('No shared value with name ? found', [name]);
    }

    if (shared is! T) {
      return Result.error('Type mismatch for shared value with name ? (expected ? but got ?)', [name, T.toString(), shared.runtimeType.toString()]);
    }

    return await callback(shared, parameters);
  });

  @override
  FutureResult<void> removeSharedValue(String name) => futureScope(() async {
    final previous = _sharedValues.remove(name);
    if (previous != null && previous is Disposable) {
      previous.dispose();
    }
    return Result.ok;
  });

  @override
  FutureResult<Stream<T>> reactToValueChange<T>(String name) => futureScopeValue(() {
    return _sharedValueChanges.stream
        .where((change) => change.$1 == name)
        .where((x) {
          if (x.$2 is T) {
            return true;
          } else {
            log('Type mismatch for shared value with name $name (expected $T but got ${x.$2.runtimeType})');
            return false;
          }
        })
        .map((change) => change.$2 as T);
  });
}
