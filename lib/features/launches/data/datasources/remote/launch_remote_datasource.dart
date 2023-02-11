import 'package:spacex_guide/core/data/datasources/remote/spacex_api.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchApi extends SpaceXApi {
  /// Calls the launches endpoint endpoint on the SpaceX api.
  Future<List<LaunchModel>> getAllLaunches() async {
    final response = await request('launches/');

    final list = <LaunchModel>[];
    response.forEach((launch) => list.add(LaunchModel.fromJSON(launch)));
    return list;
  }

  Future<LaunchModel> getLaunchWithId(int? id) async {
    final response = await request('launches/$id');
    return LaunchModel.fromJSON(response);
  }

}