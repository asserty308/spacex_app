import 'package:spacex_guide/core/data/services/network_info.dart';
import 'package:spacex_guide/features/launchpads/data/datasource/local/launchpads_local_datasource.dart';
import 'package:spacex_guide/features/launchpads/data/datasource/remote/launchpads_remote_datasource.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';

class LaunchpadRepository {
  final _remoteDatasource = LaunchpadRemoteDatasource();

  Future<List<Launchpad>> getAllLaunchpads() async {
    if (LaunchpadsLocalDatasource.allLaunchpads != null && LaunchpadsLocalDatasource.allLaunchpads.isNotEmpty) {
      return LaunchpadsLocalDatasource.allLaunchpads;
    }

    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    LaunchpadsLocalDatasource.allLaunchpads = await _remoteDatasource.getAllLaunchpads();
    return LaunchpadsLocalDatasource.allLaunchpads;
  }
}