import 'package:maxi_dart_framework/src/reflection/reflection_type.dart';

class EnumType<T extends Enum> implements ReflectionType {
  final List<T> values;

  const EnumType(this.values);

  @override
  bool get isNullable => false;

  @override
  String get name => T.toString();

  @override
  Type getDartType() => T;

  @override
  bool isExactType(Type type) => T == type;

  @override
  bool isSubtypeOf(Type type) => T == type;

  @override
  bool isObjectExactType(value) => value is T;

  @override
  bool isObjectSubtypeOf(value) => value is T;
}
