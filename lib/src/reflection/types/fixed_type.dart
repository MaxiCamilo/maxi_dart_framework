import 'package:maxi_dart_framework/src/reflection/reflection_type.dart';

final class FixedType<T extends Object> implements ReflectionType {
  @override
  final String name;

  @override
  bool get isNullable => false;

  const new({required this.name});

  @override
  Type getDartType() => T;

  @override
  bool isExactType(Type type) => T == type;

  @override
  bool isSubtypeOf(Type type) => T == type;

  @override
  bool isObjectExactType(value) => value != null && value.runtimeType == T;

  @override
  bool isObjectSubtypeOf(value) => value is T;
}
