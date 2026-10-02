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

  bool sameData(Iterable<T> other) {
    if (length != other.length) return false;
    final aIter = iterator;
    final bIter = other.iterator;
    while (aIter.moveNext() && bIter.moveNext()) {
      if (aIter.current != bIter.current) return false;
    }
    return true;
  }
}
