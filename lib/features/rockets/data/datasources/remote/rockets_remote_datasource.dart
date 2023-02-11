import 'package:spacex_guide/core/data/datasources/remote/spacex_api.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class RocketsApi extends SpaceXApi {
  /// Calls the rockets endpoint endpoint on the SpaceX api.
  Future<List<RocketModel>> getAllRockets() async {
    final response = await request('rockets/');

    final list = <RocketModel>[];
    response.forEach((rocket) => list.add(RocketModel.fromJSON(rocket)));
    return list;
  }

  /// Calls the rockets/id endpoint endpoint on the SpaceX api.
  Future<RocketModel> getRocket(String? id) async {
    final response = await request('rockets/$id');
    return RocketModel.fromJSON(response);
  }
}