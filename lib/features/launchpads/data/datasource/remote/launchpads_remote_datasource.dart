import 'package:spacex_guide/core/data/datasources/remote/spacex_api.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';

class LaunchpadApi extends SpaceXApi {
  /// Calls the launchpads endpoint on the SpaceX api
  Future<List<LaunchpadModel>> getAllLaunchpads() async {
    final response = await requestJSON('launchpads/');

    final list = <LaunchpadModel>[];
    response.forEach((launch) => list.add(LaunchpadModel.fromJSON(launch)));
    return list;
  }

  Future<LaunchpadModel> getLaunchpad(String? id) async {
    final response = await requestJSON('launchpads/$id');
    return LaunchpadModel.fromJSON(response);
  }
}