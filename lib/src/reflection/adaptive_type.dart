import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/reflection/reflection_type.dart';

abstract interface class AdaptiveType {
  ReflectionType  getReflectionType();

  bool isObjectCompatible(dynamic value);
  bool isObjectAdaptable(dynamic value);

  Result<dynamic> cloneOrAdaptValue(dynamic value);
  Result<dynamic> buildNewObject();

  Result<dynamic> parseToPrimitive(dynamic value);
}
