import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class MultiComparation implements Conditionator {
  final List<Conditionator> comparations;
  final bool isConjunction;

  const MultiComparation._({required this.comparations, required this.isConjunction});
  factory MultiComparation.and({required List<Conditionator> comparations}) {
    return MultiComparation._(comparations: comparations, isConjunction: true);
  }

  factory MultiComparation.or({required List<Conditionator> comparations}) {
    return MultiComparation._(comparations: comparations, isConjunction: false);
  }

  @override
  bool compare(value) {
    if (comparations.isEmpty) {
      return true;
    }

    if (isConjunction) {
      return comparations.every((c) => c.compare(value));
    } else {
      return comparations.any((c) => c.compare(value));
    }
  }
}
