import 'package:spacex_guide/features/history/data/datasources/local/history_local_datasource.dart';
import 'package:spacex_guide/features/history/data/datasources/remote/history_remote_datasource.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class HistoryRepository {
  final _remoteDatasource = LaunchRemoteDatasource();

  Future<List<History>> getAllEvents() async {
    if (HistoryLocalDatasource.allEvents != null && HistoryLocalDatasource.allEvents.isNotEmpty) {
      return HistoryLocalDatasource.allEvents;
    }

    HistoryLocalDatasource.allEvents = await _remoteDatasource.getAllEvents();
    return HistoryLocalDatasource.allEvents;
  }
}