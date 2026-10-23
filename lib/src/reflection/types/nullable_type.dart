import 'package:maxi_dart_framework/src/reflection/reflection_type.dart';

class NullableType<T> implements ReflectionType {
  final ReflectionType baseType;

  @override
  final String name;

  const NullableType({required this.baseType, required this.name});

  @override
  Type getDartType() => T;

  Type getOriginalDartType() => baseType.getDartType();

  @override
  bool isExactType(Type type) => T == type;

  @override
  bool isSubtypeOf(Type type) => T == type || baseType.isSubtypeOf(type);

  @override
  bool get isNullable => true;

  @override
  bool isObjectExactType(value) => value == null || baseType.isObjectExactType(value);

  @override
  bool isObjectSubtypeOf(value) => value == null || baseType.isObjectSubtypeOf(value);
}
