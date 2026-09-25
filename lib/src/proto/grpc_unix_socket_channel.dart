import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:http2/http2.dart';

T grpcBuildUnixSocket<T extends Client>(String socketPath, T Function(ClientTransportConnectorChannel channel) clientBuilder, {ChannelOptions options = const ChannelOptions()}) {
  final channel = GrpcUnixSocketChannel(socketPath, options: options);
  return clientBuilder(channel);
}


class GrpcUnixSocketChannel extends ClientTransportConnectorChannel {
  GrpcUnixSocketChannel._({
    required String socketPath,
    required ClientTransportConnector transportConnector,
    ChannelOptions options = const ChannelOptions(
      // Sin TLS — el socket es IPC local, no necesita cifrado
      credentials: ChannelCredentials.insecure(),
    ),
  }) : super(transportConnector, options: options);

  factory GrpcUnixSocketChannel(String socketPath, {ChannelOptions options = const ChannelOptions()}) {
    return GrpcUnixSocketChannel._(
      socketPath: socketPath,
      transportConnector: _GrpcUnixSocketNativeConnector(socketPath: socketPath),
      options: options,
    );
  }
}



class _GrpcUnixSocketNativeConnector implements ClientTransportConnector {
  final String socketPath;
  final Completer<void> _doneCompleter = Completer<void>();
  Socket? _socket;

  @override
  String get authority => 'localhost';

  _GrpcUnixSocketNativeConnector({required this.socketPath});

  @override
  Future<ClientTransportConnection> connect() async {
    final socket = await Socket.connect(InternetAddress(socketPath, type: InternetAddressType.unix), 0);

    _socket = socket;
    unawaited(socket.done.then((_) => _completeDone()).catchError((_) => _completeDone()));

    return ClientTransportConnection.viaSocket(socket);
  }

  @override
  Future<void> get done => _doneCompleter.future;

  @override
  void shutdown() {
    _socket?.destroy();
    _socket = null;
    _completeDone();
  }

  void _completeDone() {
    if (!_doneCompleter.isCompleted) {
      _doneCompleter.complete();
    }
  }
}
