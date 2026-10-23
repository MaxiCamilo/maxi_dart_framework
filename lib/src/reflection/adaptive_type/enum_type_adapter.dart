import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/reflection/reflection_type.dart';

final class EnumTypeAdapter implements AdaptiveType {
  final EnumType enumType;

  const new({required this.enumType});

  @override
  Result<dynamic> buildNewObject() => resultScopeValue(() => enumType.values.first);

  @override
  ReflectionType getReflectionType() => enumType;

  @override
  bool isObjectAdaptable(value) => isObjectCompatible(value) || value is num || value is String;

  @override
  bool isObjectCompatible(value) => value is Enum && enumType.values.contains(value);

  @override
  Result<dynamic> cloneOrAdaptValue(value) => resultScope(() {
    if (isObjectCompatible(value)) {
      return value;
    }
    if (value is num) {
      final i = value.toInt();
      if (i >= 0 && i < enumType.values.length) {
        return Result.value(enumType.values[i]);
      }
      return Result.error('Invalid index for enum values');
    }
    if (value is String) {
      final name = value.toLowerCase();
      final enumValue = enumType.values.select((e) => e.name.toLowerCase() == name);
      if (enumValue != null) {
        return Result.value(enumValue);
      }
      return Result.error('Invalid enum value for string: ?', [value]);
    }
    return Result.error('Unsupported value type for enum adaptation');
  });

  @override
  Result<dynamic> parseToPrimitive(value) => resultScopeValue(() {
    if (value is Enum) {
      return value.index;
    }
    return Result.error('Value is not compatible with enum');
  });
}
