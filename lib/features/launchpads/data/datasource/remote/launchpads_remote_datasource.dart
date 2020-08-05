import 'package:spacex_guide/core/data/datasources/remote/spacex_api.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';

class LaunchpadRemoteDatasource extends SpaceXApi {
  /// Calls the launchpads endpoint on the SpaceX api
  Future<List<Launchpad>> getAllLaunchpads() async {
    final response = await fetchJSON('launchpads/');

    final list = <Launchpad>[];
    response.forEach((launch) => list.add(Launchpad.fromJSON(launch)));
    return list;
  }

  Future<Launchpad> getLaunchpad(String id) async {
    final response = await fetchJSON('launchpads/$id');
    return Launchpad.fromJSON(response);
  }
}