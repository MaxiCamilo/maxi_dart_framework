import 'package:maxi_dart_framework/maxi_dart_framework.dart';

import 'dart:io';

import 'package:path/path.dart' as p;

final class ObtainAppAddress extends Logic<String> {
  const ObtainAppAddress();

  static String? _appAddressCache;

  static String? androidLocalFolder;

  @override
  Result<String> performExecution(ILifecycleScope scope) => resultScope(() {
    if (isWebPlatform) {
      return Result.value('');
    }

    if (isAndroidPlatform) {
      if (androidLocalFolder == null) {
        return Result.error('Android local folder is not set, please use "package:path_provider/path_provider.dart" or "FlutterPathProvider"');
      }
      return Result.value(androidLocalFolder!);
    }

    if (_appAddressCache != null) return Result.value(_appAddressCache!);

    if (const CheckIfItsDebug().run(scope).$) {
      _appAddressCache = '${Directory.current.path}/debug';
      volatileScope(message: Oration('Failed to create debug directory ?', [_appAddressCache!]), function: () => Directory(_appAddressCache!).createSync()).$;
    } else {
      final exe = Platform.resolvedExecutable;
      _appAddressCache = p.dirname(exe);
    }

    return Result.value(_appAddressCache!);
  });
}
