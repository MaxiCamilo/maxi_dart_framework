import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class InvocationParameters {
  static const InvocationParameters empty = InvocationParameters();

  final List fixedParameters;
  final Map<String, dynamic> namedParameters;

  const InvocationParameters({this.fixedParameters = const [], this.namedParameters = const {}});

  factory InvocationParameters.clone(InvocationParameters original, {bool avoidConstants = true}) {
    return InvocationParameters(
      fixedParameters: avoidConstants ? original.fixedParameters.toList() : original.fixedParameters,
      namedParameters: avoidConstants ? Map<String, dynamic>.from(original.namedParameters) : original.namedParameters,
    );
  }

  factory InvocationParameters.addParameters({required InvocationParameters original, bool addToEnd = true, List fixedParameters = const [], Map<String, dynamic> namedParameters = const {}}) {
    if (addToEnd) {
      return InvocationParameters(fixedParameters: [...original.fixedParameters, ...fixedParameters], namedParameters: {...original.namedParameters, ...namedParameters});
    } else {
      return InvocationParameters(fixedParameters: [...fixedParameters, ...original.fixedParameters], namedParameters: {...namedParameters, ...original.namedParameters});
    }
  }

  factory InvocationParameters.only(dynamic value) => InvocationParameters(fixedParameters: [value]);

  factory InvocationParameters.list(List values) => InvocationParameters(fixedParameters: values);

  Result<T> named<T>(String name) {
    if (namedParameters.isEmpty) {
      return Result.error('The list of named parameters is empty');
    }

    final item = namedParameters[name];

    if (item is T) {
      return Result.value(item);
    } else {
      if (item == null) {
        return Result.error('The list of arguments doesn\'t contain property %', [name]);
      } else {
        return Result.error('The parameter list contains parameter % of type %, but type % was expected', [name, item.runtimeType.toString(), T.toString()]);
      }
    }
  }

  Result<T> optionalNamed<T>({required String name, required T predetermined}) {
    if (namedParameters.isEmpty) {
      return Result.value(predetermined);
    }

    final item = namedParameters[name];
    if (item == null) {
      return Result.value(predetermined);
    }

    if (item is T) {
      return Result.value(item);
    } else {
      return Result.error('The parameter list contains parameter % of type %, but type % was expected', [name, item.runtimeType.toString(), T.toString()]);
    }
  }

  Result<T> fixed<T>([int location = 0]) {
    if (location < 0) {
      return Result.error('The context does not allow negative parameters');
    }

    if (location >= fixedParameters.length) {
      return Result.error('The context has % parameters, but parameter % (+1) was expected', [fixedParameters.length.toString(), location.toString()]);
    }

    final item = fixedParameters[location];
    if (item is T) {
      return Result.value(item);
    } else {
      return Result.error('The fixed parameter number % was expected to be of type %, but is of type %', [location.toString(), T.toString(), item.runtimeType.toString()]);
    }
  }

  Result<T> optionalFixed<T>({required int location, required T predetermined}) {
    if (location < 0) {
      return Result.error('The context does not allow negative parameters');
    }

    if (location >= fixedParameters.length) {
      return Result.value(predetermined);
    }

    final item = fixedParameters[location];
    if (item is T) {
      return Result.value(item);
    } else {
      return Result.error('The fixed parameter number % was expected to be of type %, but is of type %', [location.toString(), T.toString(), item.runtimeType.toString()]);
    }
  }

  Result<T> first<T>() => fixed<T>(0);

  Result<T> second<T>() => fixed<T>(1);

  Result<T> third<T>() => fixed<T>(2);

  Result<T> fourth<T>() => fixed<T>(3);

  Result<T> fifth<T>() => fixed<T>(4);

  Result<T> sixth<T>() => fixed<T>(5);

  Result<T> seventh<T>() => fixed<T>(6);

  Result<T> octave<T>() => fixed<T>(7);

  Result<T> ninth<T>() => fixed<T>(8);

  Result<T> last<T>() => fixed<T>(fixedParameters.length - 1);
  Result<T> penultimate<T>() => fixed<T>(fixedParameters.length - 2);
  Result<T> antepenultimate<T>() => fixed<T>(fixedParameters.length - 3);

  Result<T> reverseIndex<T>(int i) => fixed<T>(fixedParameters.length - (i + 1));
}
