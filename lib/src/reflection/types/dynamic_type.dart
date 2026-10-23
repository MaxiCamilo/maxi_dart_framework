import 'package:maxi_dart_framework/src/reflection/reflection_type.dart';

final class DynamicType implements ReflectionType {
  @override
  final String name = 'dynamic';

  const DynamicType();

  @override
  Type getDartType() => dynamic;

  @override
  bool isExactType(Type type) => type == dynamic;

  @override
  bool isSubtypeOf(Type type) => true;

  @override
  bool get isNullable => true;

  @override
  bool isObjectExactType(value) => true;

  @override
  bool isObjectSubtypeOf(value) => true;
}
