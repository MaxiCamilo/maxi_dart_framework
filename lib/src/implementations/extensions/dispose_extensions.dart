import 'package:maxi_dart_framework/maxi_dart_framework.dart';

extension DisposableExtensions on DisposableMixin {
  Result<void> checkDisposed() {
    if (isDisposed) {
      return Result.error('Object is already disposed');
    }
    return Result.ok;
  }
}
