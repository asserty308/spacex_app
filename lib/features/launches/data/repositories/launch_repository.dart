import 'package:spacex_guide/core/error/error.dart';
import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/launches/data/datasources/launch_remote_datasource.dart';

class LaunchRepository {
  final _remoteDatasource = LaunchRemoteDatasource();

  Future<dynamic> getAllLaunches() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      return AppErrorNoNetwork();
    }

    final launches = await _remoteDatasource.getAllLaunches();
    return launches;
  }

  Future<dynamic> getLaunchWithId(int id) async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      return AppErrorNoNetwork();
    }

    final launches = await _remoteDatasource.getLaunchWithId(id);
    return launches;
  }

}