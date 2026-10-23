import 'dart:convert';
import 'dart:typed_data';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:maxi_dart_framework/src/reflection/reflection_type.dart';

enum PrimitiveType {
  primitiveString,
  primitiveInt,
  primitiveDouble,
  primitiveBool,
  primitiveNum,
  primitiveDateTime,
  primitiveDuration,
  primitiveObjectMap,
  primitiveBinary,
}

final class PrimitiveTypeAdapter with SynchronousInitializationMixin implements AdaptiveType {
  final Type dartType;

  late final PrimitiveType primitiveType;
  late final ReflectionType fixedType;

  new({required this.dartType});

  @override
  Result<void> performInitialization() => resultScope(() {
    if (dartType == String) {
      primitiveType = PrimitiveType.primitiveString;
      fixedType = const FixedType<String>(name: 'String');
    } else if (dartType == int) {
      primitiveType = PrimitiveType.primitiveInt;
      fixedType = const FixedType<int>(name: 'int');
    } else if (dartType == double) {
      primitiveType = PrimitiveType.primitiveDouble;
      fixedType = const FixedType<double>(name: 'double');
    } else if (dartType == bool) {
      primitiveType = PrimitiveType.primitiveBool;
      fixedType = const FixedType<bool>(name: 'bool');
    } else if (dartType == num) {
      primitiveType = PrimitiveType.primitiveNum;
      fixedType = const FixedType<num>(name: 'num');
    } else if (dartType == DateTime) {
      primitiveType = PrimitiveType.primitiveDateTime;
      fixedType = const FixedType<DateTime>(name: 'DateTime');
    } else if (dartType == Duration) {
      primitiveType = PrimitiveType.primitiveDuration;
      fixedType = const FixedType<Duration>(name: 'Duration');
    } else if (dartType == Map<String, dynamic>) {
      primitiveType = PrimitiveType.primitiveObjectMap;
      fixedType = const CompositionType(
        name: 'Map<String,dynamic>',
        baseType: FixedType<Map>(name: 'Map'),
        composedTypes: [
          FixedType<String>(name: 'String'),
          DynamicType(),
        ],
      );
    } else if (dartType == Uint8List) {
      primitiveType = PrimitiveType.primitiveBinary;
      fixedType = const FixedType<Uint8List>(name: 'Uint8List');
    } else if (dartType == List<int>) {
      primitiveType = PrimitiveType.primitiveBinary;
      fixedType = const FixedType<List<int>>(name: 'List<int>');
    } else {
      return Result.error('Unsupported primitive type: ?', [dartType.toString()]);
    }

    return Result.ok;
  });

  @override
  Result<dynamic> buildNewObject() => resultScopeValue(() {
    initialize().$;
    switch (primitiveType) {
      case PrimitiveType.primitiveString:
        return '';
      case PrimitiveType.primitiveInt:
        return 0;
      case PrimitiveType.primitiveDouble:
        return 0.0;
      case PrimitiveType.primitiveBool:
        return false;
      case PrimitiveType.primitiveNum:
        return 0.0;
      case PrimitiveType.primitiveDateTime:
        return DateTime.now();
      case PrimitiveType.primitiveDuration:
        return Duration.zero;
      case PrimitiveType.primitiveObjectMap:
        return <String, dynamic>{};
      case PrimitiveType.primitiveBinary:
        return Uint8List(0);
    }
  });

  @override
  Result<dynamic> cloneOrAdaptValue(value) => resultScopeValue(() {
    initialize().$;
    if (value == null) return buildNewObject().$;

    switch (primitiveType) {
      case PrimitiveType.primitiveString:
        if (value is DateTime) return value.toUtc().toIso8601String();
        return value.toString();
      case PrimitiveType.primitiveInt:
        if (value is int) return value;
        if (value is num) return value.toInt();
        if (value is String) {
          return $_(Oration('The received text value cannot be converted to a numeric value'), () => int.parse(value));
        }
        if (value is bool) return value ? 1 : 0;
        if (value is DateTime) return value.toUtc().millisecondsSinceEpoch;
        if (value is Duration) return value.inMilliseconds;
        throw Invalidation(message: Oration('The received value cannot be converted to an int'));
      case PrimitiveType.primitiveDouble:
      case PrimitiveType.primitiveNum:
        if (value is double) return value;
        if (value is num) return value.toDouble();
        if (value is String) {
          return $_(Oration('The received text value cannot be converted to a numeric value'), () => double.parse(value));
        }
        if (value is bool) return value ? 1.0 : 0.0;
        if (value is DateTime) return value.toUtc().millisecondsSinceEpoch.toDouble();
        if (value is Duration) return value.inMilliseconds.toDouble();
        throw Invalidation(message: Oration('The received value cannot be converted to a double'));
      case PrimitiveType.primitiveBool:
        if (value is bool) return value;
        if (value is String) {
          final lower = value.toLowerCase();
          if (lower == 'true') return true;
          if (lower == 'false') return false;
          throw Invalidation(message: Oration('The received text value cannot be converted to a bool'));
        }
        if (value is num) return value != 0;
        throw Invalidation(message: Oration('The received value cannot be converted to a bool'));

      case PrimitiveType.primitiveDateTime:
        if (value is DateTime) return value;
        if (value is String) return $_(Oration('The received text value cannot be converted to a DateTime (ISO 8601 format expected)'), () => DateTime.parse(value));
        if (value is num) return DateTime.fromMillisecondsSinceEpoch(value.toInt(), isUtc: true).toLocal();
        throw Invalidation(message: Oration('The received value cannot be converted to a DateTime'));

      case PrimitiveType.primitiveDuration:
        if (value is Duration) return value;
        if (value is num) return Duration(milliseconds: value.toInt());
        if (value is String) return $_(Oration('The received text value cannot be converted to a Duration'), () => Duration(milliseconds: int.parse(value)));
        throw Invalidation(message: Oration('The received value cannot be converted to a Duration'));
      case PrimitiveType.primitiveObjectMap:
        if (value is Map<String, dynamic>) return value;
        if (value is String) {
          return $_(Oration('The received text value cannot be converted to a Object Map (json format expected)'), () => jsonDecode(value) as Map<String, dynamic>);
        }
        if (value is Map) {
          return value.map((key, val) => MapEntry(key.toString(), val));
        }
        if (value is Iterable) {
          return value.fold<Map<String, dynamic>>({}, (acc, element) {
            if (element is Map) {
              acc.addAll(element.map((key, val) => MapEntry(key.toString(), val)));
            }
            return acc;
          });
        }
        throw Invalidation(message: Oration('The received value cannot be converted to a Map<String, dynamic>'));
      case PrimitiveType.primitiveBinary:
        if (value is Uint8List) return value;
        if (value is List<int>) return Uint8List.fromList(value);
        if (value is String) return $_(Oration('The received text value cannot be converted to binary (base64 expected)'), () => base64.decode(value));
        throw Invalidation(message: Oration('The received value cannot be converted to binary (Uint8List expected)'));
    }
  });

  @override
  bool isObjectAdaptable(value) {
    return [value is int, value is double, value is num, value is bool, value is String, value is DateTime, value is Duration, value is Uint8List, value is Map<String, dynamic>, value is List<int>].any((element) => element);
  }

  @override
  bool isObjectCompatible(value) {
    return [value is int, value is double, value is num, value is bool, value is String, value is DateTime, value is Duration, value is Uint8List, value is Map<String, dynamic>, value is List<int>].any((element) => element);
  }

  @override
  ReflectionType getReflectionType() => resultScopeValue<ReflectionType>(() {
    initialize().$;
    return fixedType;
  }).$;

  @override
  Result<dynamic> parseToPrimitive(value) => resultScopeValue(() {
    if (value is num || value is bool || value is String) {
      return value;
    }

    if (value is Map) {
      final newMap = <String, dynamic>{};
      value.forEach((key, val) {
        if (val is String || val is num || val is bool) {
          newMap[key.toString()] = val;
        } else {
          newMap[key.toString()] = parseToPrimitive(val).$_(Oration('Failed to parse value ? to primitive ?', [val.toString()]));
        }
      });
      return newMap;
    }
    if (value is DateTime) return value.toUtc().millisecondsSinceEpoch;
    if (value is Duration) return value.inMilliseconds;
    if (value is List<int>) return $_(Oration('Failed to parse value ? to primitive ?', [value.toString()]), () => base64.encode(value));
    throw Invalidation(message: Oration('The received value cannot be converted to a primitive type'));
  });
}
