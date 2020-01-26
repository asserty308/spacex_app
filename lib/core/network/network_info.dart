import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/foundation.dart';

mixin NetworkInfo {
  static Future<bool> get isConnected async { 
    if (kIsWeb) {
      return true;
    }

    return await DataConnectionChecker().hasConnection; 
  }
}