import 'package:spacex_guide/core/data/datasources/remote/spacex_api.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class HistoryApi extends SpaceXApi {
  /// Calls the history endpoint endpoint on the SpaceX api.
  Future<List<History>> getAllEvents() async {
    final response = await request('history/') as List;

    return response
      .map((e) => History.fromJSON(e as Map<String, dynamic>))
      .toList();
  }
}