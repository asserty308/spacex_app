import 'package:spacex_guide/core/data/services/network_info.dart';
import 'package:spacex_guide/features/history/data/datasources/local/history_local_datasource.dart';
import 'package:spacex_guide/features/history/data/datasources/remote/history_remote_datasource.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class HistoryRepository {
  final _remoteDatasource = LaunchRemoteDatasource();

  Future<List<History>> getAllEvents() async {
    if (HistoryLocalDatasource.allEvents != null && HistoryLocalDatasource.allEvents.isNotEmpty) {
      return HistoryLocalDatasource.allEvents;
    }

    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    HistoryLocalDatasource.allEvents = await _remoteDatasource.getAllEvents();
    return HistoryLocalDatasource.allEvents;
  }
}