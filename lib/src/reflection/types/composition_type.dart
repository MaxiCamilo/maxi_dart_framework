import 'package:maxi_dart_framework/src/reflection/reflection_type.dart';

final class CompositionType<T extends Object> implements ReflectionType {
  @override
  final String name;

  final ReflectionType baseType;
  final List<ReflectionType> composedTypes;

  const new({required this.name, required this.baseType, required this.composedTypes});

  @override
  Type getDartType() => T;

  @override
  bool isExactType(Type type) => T == type;

  @override
  bool get isNullable => false;

  @override
  bool isObjectExactType(value) => value != null && value.runtimeType == T;

  @override
  bool isObjectSubtypeOf(value) => value is T;

  @override
  bool isSubtypeOf(Type type) => T == type;
}
