import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/proto/generated/maxi_proto.pbgrpc.dart';
import 'package:maxi_dart_framework/src/proto/grpc_unix_socket_channel.dart';

final class BuildGrpcChannel extends Logic<ClientChannelBase> {
  final String address;
  final bool isUnixSocket;
  final int standardPort;
  final Duration? connectionTimeout;
  final ChannelOptions? channelOptions;
  final Duration? idleTimeout;

  const BuildGrpcChannel({required this.address, required this.isUnixSocket, required this.standardPort, this.channelOptions, this.connectionTimeout, this.idleTimeout});

  @override
  Result<ClientChannelBase> performExecution(ILifecycleScope scope) {
    if (isUnixSocket) {
      /*
      if (appManager.isWindows || appManager.isWeb) {
        return NegativeResult.controller(
          code: ErrorCode.externalFault,
          message: const FixedOration(message: 'Unix socket is not supported on this platform.'),
        );
      }*/

      late final ClientChannelBase channel;

      ChannelOptions options = channelOptions ?? const ChannelOptions();
      if (connectionTimeout != null || idleTimeout != null) {
        options = options.copyWith(connectionTimeout: connectionTimeout, connectTimeout: connectionTimeout, idleTimeout: idleTimeout);
      }

      grpcBuildUnixSocket<MaxiAppClient>(address, (x) {
        channel = x;
        return MaxiAppClient(x);
      }, options: options);

      return Result.value(channel);
    } else {
      final port = int.tryParse(address.split(':').last) ?? standardPort;
      final host = address.split(':').first.replaceAll('http://', '');

      ChannelOptions options = channelOptions ?? const ChannelOptions(credentials: ChannelCredentials.insecure());
      if (connectionTimeout != null || idleTimeout != null) {
        options = options.copyWith(connectionTimeout: connectionTimeout, connectTimeout: connectionTimeout, idleTimeout: idleTimeout);
      }

      return Result.value(
        ClientChannel(
          host,
          port: port,
          options: options,
        ),
      );
    }
  }
}

extension on ChannelOptions {
  ChannelOptions copyWith({
    ChannelCredentials? credentials,
    Duration? idleTimeout,
    String? userAgent,
    Duration Function(Duration?)? backoffStrategy,
    Duration? connectTimeout,
    Duration? connectionTimeout,
    CodecRegistry? codecRegistry,
    ClientKeepAliveOptions? keepAlive,
    Proxy? proxy,
  }) {
    return ChannelOptions(
      credentials: credentials ?? this.credentials,
      idleTimeout: idleTimeout ?? this.idleTimeout,
      userAgent: userAgent ?? this.userAgent,
      backoffStrategy: backoffStrategy ?? this.backoffStrategy,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      connectionTimeout: connectionTimeout ?? this.connectionTimeout,
      codecRegistry: codecRegistry ?? this.codecRegistry,
      keepAlive: keepAlive ?? this.keepAlive,
      proxy: proxy ?? this.proxy,
    );
  }
}
