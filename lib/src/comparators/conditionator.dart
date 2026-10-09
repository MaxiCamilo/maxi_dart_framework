enum ConditionCompareType { equal, notEqual, greater, less, greaterEqual, lessEqual }

abstract interface class Conditionator {
  bool compare(dynamic value);
}
