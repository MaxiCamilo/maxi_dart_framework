// This is a generated file - do not edit.
//
// Generated from maxi_proto.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $0;

import 'maxi_proto.pb.dart' as $1;

export 'maxi_proto.pb.dart';

@$pb.GrpcServiceName('MaxiApp')
class MaxiAppClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  MaxiAppClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.ProtoResult> initialize(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$initialize, request, options: options);
  }

  $grpc.ResponseFuture<$1.ProtoAppStatus> getStatus(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getStatus, request, options: options);
  }

  // method descriptors

  static final _$initialize = $grpc.ClientMethod<$0.Empty, $1.ProtoResult>(
      '/MaxiApp/Initialize',
      ($0.Empty value) => value.writeToBuffer(),
      $1.ProtoResult.fromBuffer);
  static final _$getStatus = $grpc.ClientMethod<$0.Empty, $1.ProtoAppStatus>(
      '/MaxiApp/GetStatus',
      ($0.Empty value) => value.writeToBuffer(),
      $1.ProtoAppStatus.fromBuffer);
}

@$pb.GrpcServiceName('MaxiApp')
abstract class MaxiAppServiceBase extends $grpc.Service {
  $core.String get $name => 'MaxiApp';

  MaxiAppServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ProtoResult>(
        'Initialize',
        initialize_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ProtoResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ProtoAppStatus>(
        'GetStatus',
        getStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ProtoAppStatus value) => value.writeToBuffer()));
  }

  $async.Future<$1.ProtoResult> initialize_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return initialize($call, await $request);
  }

  $async.Future<$1.ProtoResult> initialize(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.ProtoAppStatus> getStatus_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getStatus($call, await $request);
  }

  $async.Future<$1.ProtoAppStatus> getStatus(
      $grpc.ServiceCall call, $0.Empty request);
}
