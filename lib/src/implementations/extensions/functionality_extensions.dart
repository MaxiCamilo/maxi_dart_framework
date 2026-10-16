import 'package:maxi_dart_framework/maxi_dart_framework.dart';

extension FunctionalityExtensions<T> on Functionality<T> {
  FutureResult<T> runOnToc() {
    return Toc.execute(parameters: InvocationParameters.only(this), function: _runOnToc<T>);
  }

  static FutureResult<T> _runOnToc<T>(InvocationParameters para) => futureScope(() async {
    final functionality = para.first<Functionality<T>>().$;
    return functionality.run();
  });
}
