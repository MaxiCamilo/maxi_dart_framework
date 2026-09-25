import 'dart:async';
import 'dart:core';

import 'package:grpc/grpc.dart';
import 'package:http2/transport.dart';

class CustomGrpcConnector extends ClientTransportConnectorChannel {
  final Stream<List<int>> incoming;
  final StreamSink<List<int>> outgoing;
  final ClientSettings? settings;

  CustomGrpcConnector({required this.incoming, required this.outgoing, this.settings, super.options}) : super(_ClientTransportConnector(incoming: incoming, outgoing: outgoing, settings: settings));
}

class _ClientTransportConnector extends ClientTransportConnector {
  final Stream<List<int>> incoming;
  final StreamSink<List<int>> outgoing;
  final ClientSettings? settings;

  bool _isShutdown = false;
  final _shutdownCompleter = Completer();

  _ClientTransportConnector({required this.incoming, required this.outgoing, this.settings});

  @override
  String get authority => '';

  @override
  Future<ClientTransportConnection> connect() async {
    return ClientTransportConnection.viaStreams(incoming, outgoing, settings: settings);
  }

  @override
  Future<dynamic> get done => _shutdownCompleter.future;

  @override
  void shutdown() {
    if (_isShutdown) {
      return;
    }
    _isShutdown = true;
    outgoing.close();
    _shutdownCompleter.complete();
  }
}
