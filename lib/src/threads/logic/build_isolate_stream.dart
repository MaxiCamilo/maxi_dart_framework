import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

final class BuildIsolateStream<T> extends Functionality<Stream<T>> {
  final InvocationParameters parameters;
  final Future<Result<Stream<T>>> Function(InvocationParameters parameters) function;

  new({required this.parameters, required this.function});

  @override
  FutureResult<Stream<T>> performExecution(ILifecycleScope scope) => futureScopeValue(() async {
    final master = MasterChannel<T, T>();
    final channel = await $$_(Toc.buildSharedConnector(master));

    await $$_(
      Toc.execute(
        parameters: InvocationParameters.addParameters(
          original: parameters,
          namedParameters: {
            '%?&StreamFunc': function,
            '%?&StreamChan': channel,
          },
        ),
        function: _functionOnThread<T>,
      ),
    );

    return master.getReceiver().$;
  });

  static FutureResult<void> _functionOnThread<R>(InvocationParameters parameter) => futureScopeVoid(() async {
    final function = parameter.named<Future<Result<Stream<R>>> Function(InvocationParameters)>('%?&StreamFunc').$;
    final channel = parameter.named<Channel<R, R>>('%?&StreamChan').$;

    final stream = await $$_(function(parameter));
    stream.listen(
      (x) => channel.sendItem(x).logIfFailure('Failed to send item to channel'),
      onDone: () => channel.dispose(),
    );
  });
}
