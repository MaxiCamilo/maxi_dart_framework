extension IterableExtensions<T> on Iterable<T> {
  T? select(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  T maximumOf(num Function(T x) funcion) {
    return reduce((curr, next) => funcion(curr) > funcion(next) ? curr : next);
  }

  T minimumOf(num Function(T x) funcion) {
    return reduce((curr, next) => funcion(curr) < funcion(next) ? curr : next);
  }
}
