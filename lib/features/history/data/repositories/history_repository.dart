import 'package:spacex_guide/features/history/data/datasources/local/history_local_datasource.dart';
import 'package:spacex_guide/features/history/data/datasources/remote/history_remote_datasource.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:meta/meta.dart';

class HistoryRepository {
  HistoryRepository({
    @required this.historyRemoteDatasource,
  });

  final HistoryApi historyRemoteDatasource;
  
  Future<List<History>> getAllEvents() async {
    if (HistoryLocalDatasource.allEvents != null && HistoryLocalDatasource.allEvents.isNotEmpty) {
      return HistoryLocalDatasource.allEvents;
    }

    HistoryLocalDatasource.allEvents = await historyRemoteDatasource.getAllEvents();
    return HistoryLocalDatasource.allEvents;
  }
}