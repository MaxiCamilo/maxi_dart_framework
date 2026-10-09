import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class AntagonicComparation implements Conditionator {
  final Conditionator comparation;

  const new(this.comparation);

  @override
  bool compare(value) {
    return !comparation.compare(value);
  }
}
