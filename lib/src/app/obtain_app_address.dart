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

    final exe = Platform.resolvedExecutable;
    final name = p.basenameWithoutExtension(exe);

    if (name == 'dart' || name == 'dartaotruntime') {
      _appAddressCache = Directory.current.path;
    } else {
      _appAddressCache = p.dirname(exe);
    }

    if (CheckIfItsDebug().run(scope).$) {
      _appAddressCache = '$_appAddressCache/debug';
      volatileScope(message: Oration('Failed to create debug directory ?', [_appAddressCache!]), function: () => Directory(_appAddressCache!).createSync()).$;
    }

    return _appAddressCache!;
  });
}
