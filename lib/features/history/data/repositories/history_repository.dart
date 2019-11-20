import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/history/data/datasources/history_remote_datasource.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class HistoryRepository {
  final remoteDatasource = LaunchRemoteDatasource();

  Future<List<History>> getAllEvents() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling
      return <History>[];
    }

    final events = await remoteDatasource.getAllEvents();

    // TODO: Handle no data
    return events;
  }
}