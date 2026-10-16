@Timeout(Duration(minutes: 25))
library;

import 'dart:developer';

import 'package:maxi_dart_framework/maxi_dart_framework.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test(
      'Test TOC',
      () => futureScopeVoid(() async {
        final task1 = Toc.execute(
          function: (parameter) async {
            await Future.delayed(Duration(seconds: 10));
            return Result.value('Hello, TOC 1!');
          },
        );

        final task2 = Toc.execute(
          function: (parameter) async {
            await Future.delayed(Duration(seconds: 21));
            final other = await $$_(
              Toc.execute(
                function: (parameter) async {
                  await Future.delayed(Duration(seconds: 5));
                  return Result.value('Hello, TOC other!');
                },
              ),
            );
            return Result.value('Hello, TOC 2 and $other!');
          },
        );

        final task3 = Toc.execute(
          function: (parameter) async {
            await Future.delayed(Duration(seconds: 5));
            return Result.value('Hello, TOC 3!');
          },
        );

        final task4 = Toc.execute(
          function: (parameter) async {
            await Future.delayed(Duration(seconds: 7));
            return Result.value('Hello, TOC 4!');
          },
        );

        final task5 = Toc.execute(
          function: (parameter) async {
            await Future.delayed(Duration(seconds: 9));
            return Result.value('Hello, TOC 5!');
          },
        );

        final resultList = await Future.wait([task1, task2, task3, task4, task5]);

        log('Result from TOC execution: $resultList');
      }),
    );

    test('Test TOC Channels', () async {
      final broadcast = MasterChannel<String, int>();

      broadcast.getReceiver().$.listen((event) async {
        log('Received event: $event');
        await Future.delayed(const Duration(seconds: 5));
        broadcast.sendItem(21).$;
      });

      final shared = await $$_(Toc.connectToMasterChannel(broadcast));

      await Toc.execute(
        parameters: InvocationParameters.only(shared),
        function: (para) => futureScopeVoid(
          () async {
            final channel = para.first<Channel<int, String>>().$;
            channel.getReceiver().$.listen((numData) {
              log('Received number data: $numData');
            });

            channel.sendItem('Holiiisss').$;
            await Future.delayed(const Duration(seconds: 10));
            channel.dispose();
            await Future.delayed(const Duration(seconds: 50));
          },
        ),
      );
    });
  });
}
