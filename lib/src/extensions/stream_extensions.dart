import 'dart:async';

import 'package:rxdart/rxdart.dart';

extension StreamExtensions<T> on Stream<T> {
  Stream<T> autoclose(Duration duration) {
    final controller = StreamController<T>();

    late Timer closeTimer;

    final subscription = listen(
      (event) {
        controller.add(event);
      },
      onError: (error, stackTrace) {
        controller.addError(error, stackTrace);
      },
      onDone: () {
        closeTimer.cancel();
        controller.close();
      },
    );

    closeTimer = Timer(duration, () {
      subscription.cancel();
      controller.close();
    });

    return controller.stream.doOnCancel(() {
      subscription.cancel();
      closeTimer.cancel();
    });
  }
}
