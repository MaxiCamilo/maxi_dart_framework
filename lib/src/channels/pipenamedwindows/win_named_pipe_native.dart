import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/channels/pipenamedwindows/native/win_named_pipe_client.dart';
import 'package:maxi_dart_framework/src/channels/pipenamedwindows/native/win_named_pipe_server.dart';

WinPipeNamedServer internalBuildPipeNamedServer(String name) => ImplPipeNamedPipeServer(name);
Channel<List<int>, List<int>>? internalConnectPipeNamedChannel(String name) => PipeChannelWinClient.connect(name) ;
bool internalIsWinPipeNamedPipeSupported() => true;