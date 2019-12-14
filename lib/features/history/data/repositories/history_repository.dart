import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/history/data/datasources/history_remote_datasource.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class HistoryRepository {
  final _remoteDatasource = LaunchRemoteDatasource();

  Future<List<History>> getAllEvents() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    final events = await _remoteDatasource.getAllEvents();
    return events;
  }
}