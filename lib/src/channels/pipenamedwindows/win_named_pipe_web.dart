import 'package:maxi_dart_framework/maxi_dart_framework.dart';

WinPipeNamedServer internalBuildPipeNamedServer(String name) => throw UnimplementedError('Web platform does not support named pipe servers.');
Channel<List<int>, List<int>>? internalConnectPipeNamedChannel(String name) => throw UnimplementedError('Web platform does not support named pipe channels.');
bool internalIsWinPipeNamedPipeSupported() => false;
