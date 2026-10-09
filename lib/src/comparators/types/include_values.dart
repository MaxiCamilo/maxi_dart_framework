import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class IncludeValues implements Conditionator {
  final List values;

  const new({required this.values});

  @override
  bool compare(value) {
    if (value == null) {
      return false;
    }
    return values.contains(value);
  }
}
