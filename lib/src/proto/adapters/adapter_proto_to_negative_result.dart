import 'package:maxi_dart_framework/maxi_dart_framework.dart';

extension AdapterProtoToInvalidationExtension on ProtoInvalidation {
  Invalidation toInvalidation() {
    final oration = message.toOration();

    return Invalidation(message: oration);
  }
}

extension AdapterInvalidationToProtoExtension on Invalidation {
  ProtoInvalidation toProto() {
    final messageProto = message.toProto();
    return ProtoInvalidation(message: messageProto, errorCode: 1);
  }
}
