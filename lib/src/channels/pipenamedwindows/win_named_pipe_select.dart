import 'package:maxi_dart_framework/maxi_dart_framework.dart';

import 'win_named_pipe_stub.dart' if (dart.library.ffi) 'win_named_pipe_native.dart' if (dart.library.js_interop) 'win_named_pipe_web.dart';

bool isWinPipeNamedPipeSupported() => internalIsWinPipeNamedPipeSupported();
WinPipeNamedServer buildWinPipeNamedServer(String name) => internalBuildPipeNamedServer(name);
Channel<List<int>, List<int>>? connectPipeNamedChannel(String name) => internalConnectPipeNamedChannel(name);
