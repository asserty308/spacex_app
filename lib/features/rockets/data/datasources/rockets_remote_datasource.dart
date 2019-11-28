import 'package:spacex_guide/core/api/spacex_api.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class RocketsRemoteDatasource extends SpaceXApi {
  /// Calls the rockets endpoint endpoint on the SpaceX api.
  Future<List<Rocket>> getAllRockets() async {
    final response = await fetchJSON('rockets/');

    final list = <Rocket>[];
    response.forEach((rocket) => list.add(Rocket.fromJSON(rocket)));
    return list;
  }
}