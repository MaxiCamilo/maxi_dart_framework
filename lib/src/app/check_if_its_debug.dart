import 'package:maxi_dart_framework/maxi_dart_framework.dart';

final class CheckIfItsDebug extends Logic<bool> {
  const CheckIfItsDebug();

  static bool? _isDebugCache;

  @override
  Result<bool> performExecution(ILifecycleScope scope) {
    if (_isDebugCache != null) return Result.value(_isDebugCache!);

    //_isDebugCache = Platform.environment['PUB_ENVIRONMENT'] == 'vscode.dart-code';

    //return Result.value(_isDebugCache!);

    var d = false;
    assert(d = true);
    _isDebugCache = d;
    return Result.value(_isDebugCache!);
  }
}
