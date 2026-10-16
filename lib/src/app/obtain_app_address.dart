import 'package:maxi_dart_framework/maxi_dart_framework.dart';

import 'dart:io';

import 'package:path/path.dart' as p;

final class ObtainAppAddress extends Logic<String> {
  const ObtainAppAddress();

  static String? _appAddressCache;

  @override
  Result<String> performExecution(ILifecycleScope scope) => resultScopeValue(() {
    if (isWebPlatform) {
      return '';
    }

    if (_appAddressCache != null) return _appAddressCache!;

    if (const CheckIfItsDebug().run(scope).$) {
      _appAddressCache = '${Directory.current.path}/debug';
      volatileScope(message: Oration('Failed to create debug directory ?', [_appAddressCache!]), function: () => Directory(_appAddressCache!).createSync()).$;
    } else {
      final exe = Platform.resolvedExecutable;
      _appAddressCache = p.dirname(exe);
    }

    return _appAddressCache!;
  });
}
