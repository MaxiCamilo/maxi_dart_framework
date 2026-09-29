import 'package:maxi_dart_framework/maxi_dart_framework.dart';

extension AdapterProtoToOrationExtension on ProtoOration {
  Oration toOration() => Oration(text, textParts.toList(growable: false));
}

extension AdapterOrationToProtoExtension on Oration {
  ProtoOration toProto() {
    return ProtoOration(text: message, textParts: parts);
  }
}
