import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class CompareValues implements Conditionator {
  final dynamic origin;
  final ConditionCompareType compareType;

  const new({required this.origin, required this.compareType});

  factory CompareValues.equal(Object original) {
    return CompareValues(origin: original, compareType: ConditionCompareType.equal);
  }

  factory CompareValues.notEqual(Object original) {
    return CompareValues(origin: original, compareType: ConditionCompareType.notEqual);
  }

  factory CompareValues.greater(Object original) {
    return CompareValues(origin: original, compareType: ConditionCompareType.greater);
  }

  factory CompareValues.less(Object original) {
    return CompareValues(origin: original, compareType: ConditionCompareType.less);
  }

  factory CompareValues.greaterEqual(Object original) {
    return CompareValues(origin: original, compareType: ConditionCompareType.greaterEqual);
  }

  factory CompareValues.lessEqual(Object original) {
    return CompareValues(origin: original, compareType: ConditionCompareType.lessEqual);
  }

  @override
  bool compare(value) {
    switch (compareType) {
      case ConditionCompareType.equal:
        return origin == value;
      case ConditionCompareType.notEqual:
        return origin != value;
      case ConditionCompareType.greater:
        if (origin is Comparable && value is Comparable) {
          return (origin as Comparable).compareTo(value) > 0;
        }
        throw ArgumentError('Values must be comparable for greater comparison');
      case ConditionCompareType.less:
        if (origin is Comparable && value is Comparable) {
          return (origin as Comparable).compareTo(value) < 0;
        }
        throw ArgumentError('Values must be comparable for less comparison');
      case ConditionCompareType.greaterEqual:
        if (origin is Comparable && value is Comparable) {
          return (origin as Comparable).compareTo(value) >= 0;
        }
        throw ArgumentError('Values must be comparable for greater equal comparison');
      case ConditionCompareType.lessEqual:
        if (origin is Comparable && value is Comparable) {
          return (origin as Comparable).compareTo(value) <= 0;
        }
        throw ArgumentError('Values must be comparable for less equal comparison');
    }
  }
}
