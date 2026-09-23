import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class TaskInstance<T> implements Disposable {
  FutureResult<T> waitResult();
}
