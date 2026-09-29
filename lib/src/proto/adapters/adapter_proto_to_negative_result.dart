import 'package:maxi_dart_framework/maxi_dart_framework.dart';

extension AdapterProtoToNegativeResultExtension on ProtoNegativeResult {
  NegativeResult toNegativeResult() {
    final oration = message.toOration();

    return NegativeResult(message: oration);
  }
}

extension AdapterNegativeResultToProtoExtension on NegativeResult {
  ProtoNegativeResult toProto() {
    final messageProto = message.toProto();
    return ProtoNegativeResult(message: messageProto, errorCode: 1);
  }
}
