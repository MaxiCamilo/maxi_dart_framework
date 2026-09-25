import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class SynchronousInitialization {
  bool get isInitialized;
  Result<void> initialize();
}

mixin SynchronousInitializationMixin implements SynchronousInitialization {
  @override
  bool get isInitialized => _isInitialized;

  bool _isInitialized = false;
  bool _isInitializing = false;

  Result<void> performInitialization();

  @override
  Result<void> initialize() {
    if (_isInitialized) {
      return Result.ok;
    }
    if (_isInitializing) {
      return Result.error('Initialization already in progress');
    }
    _isInitializing = true;
    _isInitializing = false;
    try {
      final result = performInitialization();

      if (result is ResultValue) {
        _isInitialized = true;
      }
      _isInitializing = false;
      return result;
    } catch(e,st) {
      _isInitializing = false;
      return ExceptionResult(exception: e, stackTrace: st);
      
    }
    
  }
}
