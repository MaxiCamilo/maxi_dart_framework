import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

abstract interface class Channel<R, S> implements Disposable {
  bool get isActive;

  Result<Stream<R>> getReceiver();

  Result<void> sendItem(S item);
}

extension ChannelExtension<R, S> on Channel<R, S> {
  Type get receiverType => R;
  Type get senderType => S;

  Result<void> reflectChannel(Channel<S, R> other) => resultScope(() {
    final stream = getReceiver().$;

    final otherReceiver = other.getReceiver().$;

    late final StreamSubscription thisSubscription;
    late final StreamSubscription otherSubscription;

    thisSubscription = stream.listen((item) => other.sendItem(item), onDone: () => otherSubscription.cancel());
    otherSubscription = otherReceiver.listen((item) => sendItem(item), onDone: () => thisSubscription.cancel());
    return voidResult;
  });
}
