import 'package:spacex_guide/core/api/spacex_api.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchRemoteDatasource {
  final _api = SpaceXAPI();

  /// Calls the launches endpoint endpoint on the SpaceX api.
  Future<List<Launch>> getAllLaunches() async {
    final response = await _api('launches/') ?? [];

    final list = <Launch>[];
    response.forEach((launch) => list.add(Launch.fromJSON(launch)));
    return list;
  }

}