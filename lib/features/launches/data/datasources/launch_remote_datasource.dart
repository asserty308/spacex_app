import 'package:spacex_guide/core/api/spacex_api.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchRemoteDatasource extends SpaceXApi {
  /// Calls the launches endpoint endpoint on the SpaceX api.
  Future<List<Launch>> getAllLaunches() async {
    final response = await fetchJSON('launches/');

    final list = <Launch>[];
    response.forEach((launch) => list.add(Launch.fromJSON(launch)));
    return list;
  }

  Future<Launch> getLaunchWithId(int id) async {
    final response = await fetchJSON('launches/$id');
    return Launch.fromJSON(response);
  }

}