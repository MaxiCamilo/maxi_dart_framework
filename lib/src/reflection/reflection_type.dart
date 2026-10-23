abstract interface class ReflectionType {
  String get name;
  bool get isNullable;

  Type getDartType();

  bool isExactType(Type type);
  bool isSubtypeOf(Type type);

  bool isObjectExactType(dynamic value);
  bool isObjectSubtypeOf(dynamic value);
}
