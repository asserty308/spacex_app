import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/launches/data/datasources/launch_remote_datasource.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchRepository {
  final remoteDatasource = LaunchRemoteDatasource();

  Future<List<Launch>> getAllLaunches() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling
      return <Launch>[];
    }

    final launches = await remoteDatasource.getAllLaunches();

    // TODO: Handle no data
    return launches;
  }

}