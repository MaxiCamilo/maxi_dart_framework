import 'check_web_plataform_io.dart' if (dart.library.js_interop) 'check_web_plataform_web.dart';

bool get isWebPlatform => internalIsWebPlatform();
bool get isWindowsPlatform => internalIsWindowsPlatform();
bool get isLinuxPlatform => internalIsLinuxPlatform();
bool get isMacOSPlatform => internalIsMacOSPlatform();
bool get isAndroidPlatform => internalIsAndroidPlatform();
bool get isIOSPlatform => internalIsIOSPlatform();
