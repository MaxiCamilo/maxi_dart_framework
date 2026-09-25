import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class AppStatus {
  String name = '';
  double version = 0;
  bool isEnable = false;
  bool isInitialized = false;
  NegativeResult lastInitError = NegativeResult(message: 
    const Oration('App is not initialized'),
  );
}
