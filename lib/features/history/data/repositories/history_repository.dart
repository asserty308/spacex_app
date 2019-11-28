import 'package:spacex_guide/core/error/error.dart';
import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/history/data/datasources/history_remote_datasource.dart';

class HistoryRepository {
  final _remoteDatasource = LaunchRemoteDatasource();

  Future<dynamic> getAllEvents() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      return AppErrorNoNetwork();
    }

    final events = await _remoteDatasource.getAllEvents();
    return events;
  }
}