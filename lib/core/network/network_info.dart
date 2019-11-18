import 'package:data_connection_checker/data_connection_checker.dart';

mixin NetworkInfo {
  static Future<bool> get isConnected => DataConnectionChecker().hasConnection;
}