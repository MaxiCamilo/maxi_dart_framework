import 'dart:async';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';

mixin Interactive {
  static const Symbol interactiveChannelKey = #interactiveChannel;

  static Result<Channel> _obtainInteractiveChannel() => resultScope(() {
    final channel = Zone.current[interactiveChannelKey];
    if (channel == null) {
      return Result.error('Interactive channel not found in the current zone');
    }
    return ResultValue(channel);
  });

  static Result<void> sendData(dynamic data) => resultScopeVoid(() {
    final channel = _obtainInteractiveChannel().$;
    channel.sendItem(data).$;
  });

  static Result<Stream> getReceive() => resultScope(() {
    final channel = _obtainInteractiveChannel().$;
    return channel.getReceiver();
  });

  static bool get hasInteractiveChannel => Zone.current[interactiveChannelKey] != null && Zone.current[interactiveChannelKey] is Channel && (Zone.current[interactiveChannelKey] as Channel).isActive;

  static Result<(Symbol, Channel)> buildChannel() => resultScope(() {
    final exists = Zone.current[interactiveChannelKey];
    if (exists != null) {
      if (exists! is Channel) {
        return Result.error('Existing interactive channel is not a valid Channel');
      }

      return ResultValue((interactiveChannelKey, exists));
    }

    return ResultValue((interactiveChannelKey, BroadcastChannel()));
  });
}
