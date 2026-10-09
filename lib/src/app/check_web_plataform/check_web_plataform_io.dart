import 'package:meta/meta.dart';

import 'dart:io' show Platform;

@internal
bool internalIsWebPlatform() => false;
@internal
bool internalIsWindowsPlatform() => Platform.isWindows;
@internal
bool internalIsLinuxPlatform() => Platform.isLinux;
@internal
bool internalIsMacOSPlatform() => Platform.isMacOS;
@internal
bool internalIsAndroidPlatform() => Platform.isAndroid;
@internal
bool internalIsIOSPlatform() => Platform.isIOS;
