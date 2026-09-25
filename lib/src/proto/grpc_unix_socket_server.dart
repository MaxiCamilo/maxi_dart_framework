import 'dart:io';
//import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:maxi_dart_framework/maxi_dart_framework.dart';

//import 'package:http2/http2.dart' as http2;

class GrpcUnixSocketServer with AsynchronousInitializationMixin, DisposableMixin, WithLifecycleScopeMixin {
  final String address;

  final List<Service> services;
  final ServerKeepAliveOptions keepAliveOptions;

  late Server _serverInstance;

  GrpcUnixSocketServer({required this.address, required this.services, this.keepAliveOptions = const ServerKeepAliveOptions(minIntervalBetweenPingsWithoutData: Duration(seconds: 15), maxBadPings: 3)});

  @override
  Future<Result<void>> performInitialization() => futureScope(() async {
    _serverInstance = Server.create(services: services, keepAliveOptions: keepAliveOptions);
    heart.onDispose(() => _serverInstance.shutdown());

    final previousSocketFile = File(address);
    final exists = await previousSocketFile.exists().asResult('Failed to check if socket file exists').$;

    if (exists) {
      //⨻⟴
      print('⟁ Warning: Socket file $address already exists. It will be deleted to create the grpc server.');
      await previousSocketFile.delete().asResult('Failed to delete existing socket file in %: %', [address]).$;
    }

    await _serverInstance.serve(address: InternetAddress(address, type: InternetAddressType.unix), port: 0).asResult('Failed to start grpc server on unix socket %: %', [address]).$;
    return Result.ok;
  });

  /*
  Future<void> _onNewClient(Channel<Uint8List, Uint8List> channel) async {
    final transport = http2.ServerTransportConnection.viaStreams(channel.getReceiver().content, channel.toSink());
    final connectionResult = await _serverInstance.serveConnection(connection: transport).toFutureResult().logIfFails(errorName: 'Error serving grpc connection');
    if (connectionResult.itsCorrect) {
      lifecycleScope.joinManualDisposableObject(transport, onDisponse: (_) => transport.finish());
    }
  }*/
}
