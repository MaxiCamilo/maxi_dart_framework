import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class SharedValue<T> {
  final String name;

  const new({required this.name});

  FutureResult<bool> hasDefinedValue() => Toc.executeOnManager(
    parameters: InvocationParameters.only(name),
    function: (main, para) => futureScope(() => main.hasSharedValue(para.first<String>().$)),
  );

  FutureResult<T> getValue([T? defaultValue]) => Toc.executeOnManager(
    parameters: InvocationParameters.list([name, defaultValue]),
    function: (main, para) => futureScope(() => main.getSharedValue<T>(para.first<String>().$, para.second<T?>().$)),
  );

  FutureResult<void> setValue(T value) => Toc.executeOnManager(
    parameters: InvocationParameters.list([name, value]),
    function: (main, para) => futureScope(() => main.setSharedValue<T>(para.first<String>().$, para.second<T>().$)),
  );

  FutureResult<void> removeValue() => Toc.executeOnManager(
    parameters: InvocationParameters.only(name),
    function: (main, para) => futureScope(() => main.removeSharedValue(para.first<String>().$)),
  );

  FutureResult<Stream<T>> reactToValueChange() => futureScopeValue(() async {
    final masterChannel = MasterChannel<T, T>();
    final sharedChannel = await $$_(Toc.connectToMasterChannel(masterChannel));
    return sharedChannel.getReceiver().$;
  });

  FutureResult<T> waitDefinition([Duration? timeout]) => futureScope(() async {
    if (await $$_(hasDefinedValue())) {
      return getValue();
    }

    final completer = Completer<Result<T>>();
    late final StreamSubscription subscription;

    subscription = (await $$_(reactToValueChange())).listen((x) {
      if (completer.isCompleted) return;
      completer.complete(Result.value(x));
      subscription.cancel();
    });

    if (timeout != null) {
      completer.future.timeout(
        timeout,
        onTimeout: () {
          subscription.cancel();
          if (!completer.isCompleted) {
            completer.complete(Result.error("Timeout waiting for shared value definition"));
          }
          return Result.error("Timeout waiting for shared value definition");
        },
      );
    }

    return completer.future.whenComplete(() => subscription.cancel());
  });
}
