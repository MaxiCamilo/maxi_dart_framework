import 'dart:async';
import 'dart:developer';

import 'dart:core';

import 'package:grpc/grpc.dart';
import 'package:http2/transport.dart';
import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:rxdart/rxdart.dart';

class CustomGrpcConnectorChannel extends ClientTransportConnectorChannel {
  final Channel<List<int>, List<int>> channel;
  final ClientSettings? settings;

  CustomGrpcConnectorChannel({required this.channel, required this.settings}) : super(_CustomGrpcConnectorChannel(channel: channel, settings: settings));
}

class _CustomGrpcConnectorChannel extends ClientTransportConnector implements StreamSink<List<int>>, WithLifecycleScope {
  final Channel<List<int>, List<int>> channel;
  final ClientSettings? settings;

  LifecycleScope? lifecycleScope;

  _CustomGrpcConnectorChannel({required this.channel, required this.settings});

  @override
  LifecycleScope get heart {
    if (lifecycleScope == null) {
      lifecycleScope = LifecycleScope();
      lifecycleScope!.onDispose(() {
        channel.dispose();
      });
    }
    return lifecycleScope!;
  }

  @override
  String get authority => '';

  @override
  Future<ClientTransportConnection> connect() async {
    final stream = channel.getReceiver().$.doOnCancel(heart.dispose).doOnDone(heart.dispose);

    return ClientTransportConnection.viaStreams(stream, this, settings: settings);
  }

  @override
  Future<dynamic> get done => heart.waitDisposed();

  @override
  void shutdown() {
    channel.dispose();
  }

  @override
  void add(List<int> event) {
    channel.sendItem(event);
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    log(error.toString(), stackTrace: stackTrace);
  }

  @override
  Future<dynamic> addStream(Stream<List<int>> stream) {
    final completer = Completer();
    heart
        .attachStream(
          stream: stream,
          onData: (event) {
            add(event);
          },
          onError: (error, stackTrace) {
            addError(error, stackTrace);
          },
          onDone: () {
            completer.complete();
          },
        )
        .$;

    return completer.future;
  }

  @override
  Future<dynamic> close() async {
    channel.dispose();
    disposeHeart();
  }

  @override
  void disposeHeart() {
    lifecycleScope?.dispose();
    lifecycleScope = null;
  }
}
