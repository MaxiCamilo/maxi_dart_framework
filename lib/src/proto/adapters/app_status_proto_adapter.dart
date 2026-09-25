import 'package:maxi_dart_framework/src/proto/adapters/adapter_proto_to_negative_result.dart';
import 'package:maxi_dart_framework/src/proto/generated/maxi_proto.pb.dart';
import 'package:maxi_dart_framework/src/proto/models/app_status.dart';

extension ProtoAppStatusAdapterExtension on ProtoAppStatus {
  AppStatus toNative() {
    final appStatus = AppStatus()
      ..name = name
      ..version = version
      ..isEnable = isEnable
      ..isInitialized = isInitialized_4;

    if (hasLastInitError()) {
      final lastInitError = this.lastInitError.toNegativeResult();

      appStatus.lastInitError = lastInitError;
    }
    return appStatus;
  }
}

extension AppStatusProtoAdapterExtension on AppStatus {
  ProtoAppStatus toProto() {
    return ProtoAppStatus(name: name, version: version, isEnable: isEnable, isInitialized_4: isInitialized, lastInitError: lastInitError.toProto());
  }
}
