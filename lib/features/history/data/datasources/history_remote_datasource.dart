import 'package:spacex_guide/core/data/datasources/remote/spacex_api.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class LaunchRemoteDatasource extends SpaceXApi {
  /// Calls the history endpoint endpoint on the SpaceX api.
  Future<List<History>> getAllEvents() async {
    final response = await fetchJSON('history/');

    final list = <History>[];
    response.forEach((event) => list.add(History.fromJSON(event)));
    return list;
  }

}