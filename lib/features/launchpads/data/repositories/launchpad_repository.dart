import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/launchpads/data/datasource/launchpads_remote_datasource.dart';

class LaunchpadRepository {
  final _remoteDatasource = LaunchpadRemoteDatasource();

  Future<dynamic> getAllLaunches() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    final launchpads = _remoteDatasource.getAllLaunchpads();
    return launchpads;
  }
}