import 'package:spacex_guide/core/api/spacex_api.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class LaunchRemoteDatasource {
  final _api = SpaceXAPI();

  /// Calls the history endpoint endpoint on the SpaceX api.
  Future<List<History>> getAllEvents() async {
    final response = await _api('history/') ?? [];

    final list = <History>[];
    response.forEach((launch) => list.add(History.fromJSON(launch)));
    return list;
  }

}