import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class SimilarText implements Conditionator {
  final String text;
  final bool differentiateUppercaseLetters;

  const new({required this.text, this.differentiateUppercaseLetters = false});

  @override
  bool compare(value) {
    if(value == null) {
      return false;
    }

    if (differentiateUppercaseLetters) {
      return value.toString().contains(text);
    } else {
      return value.toString().toLowerCase().contains(text.toLowerCase());
    }
  }
}
