import 'dart:async';
import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class AsynchronousInitialization {
  bool get isInitialized;
  FutureResult<void> initialize();
}

mixin AsynchronousInitializationMixin implements AsynchronousInitialization {
  bool _isInitialized = false;
  Completer<Result<void>>? _initializationCompleter;

  FutureResult<void> performInitialization();

  @override
  bool get isInitialized => _isInitialized;

  @override
  FutureResult<void> initialize() => futureScope(() async {
    if (_isInitialized) return Result.ok;

    if (_initializationCompleter != null) {
      log('Initialization is already in progress');
      return _initializationCompleter!.future;
    }

    _initializationCompleter = Completer<Result<void>>();

    try {
      final result = await performInitialization();
      if (result is ResultValue) {
        _isInitialized = true;
      }

      _initializationCompleter!.complete(result);
      _initializationCompleter = null;
      return result;
    } catch (e, stackTrace) {
      final error = ExceptionResult(exception: e, stackTrace: stackTrace, message: Oration('Initialization failed'));
      _initializationCompleter!.complete(error);
      _initializationCompleter = null;

      if (this is WithLifecycleScope) {
        (this as WithLifecycleScope).disposeHeart();
      }

      return error;
    }
  });
}
