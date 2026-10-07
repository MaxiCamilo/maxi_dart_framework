import 'package:maxi_dart_framework/maxi_dart_framework.dart';



abstract interface class WinPipeNamedServer implements Disposable, SynchronousInitialization {
  Stream<Channel<List<int>, List<int>>> get onNewClient;
}

