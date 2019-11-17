import 'package:spacex_guide/core/api/spacex_api.dart';
import 'package:spacex_guide/features/launches/data/models/launch_model.dart';
import 'package:spacex_guide/features/launches/domain/entities/launch.dart';

abstract class _LaunchRemoteDatasourceInterface {
  /// Calls the launches endpoint endpoint on the SpaceX api.
  Future<List<Launch>> getAllLaunches(); 
}

class LaunchRemoteDatasource implements _LaunchRemoteDatasourceInterface {
  final _api = SpaceXAPI();

  @override
  Future<List<Launch>> getAllLaunches() async {
    final List response = await _api('launches/') ?? [];

    var list = List<Launch>();
    response.forEach((launch) => list.add(LaunchModel.fromJSON(launch)));
    return list;
  }

}