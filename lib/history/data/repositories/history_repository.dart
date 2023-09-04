import 'package:get_it/get_it.dart';
import 'package:spacex_guide/history/data/datasources/local/history_local_datasource.dart';
import 'package:spacex_guide/history/data/datasources/remote/history_remote_datasource.dart';
import 'package:spacex_guide/history/data/models/history.dart';

class HistoryRepository {
  final HistoryApi? historyRemoteDatasource = GetIt.I<HistoryApi>();
  
  Future<List<History>?> getAllEvents() async {
    if (HistoryLocalDatasource.allEvents != null && HistoryLocalDatasource.allEvents!.isNotEmpty) {
      return HistoryLocalDatasource.allEvents;
    }

    HistoryLocalDatasource.allEvents = await historyRemoteDatasource!.getAllEvents();
    return HistoryLocalDatasource.allEvents;
  }
}