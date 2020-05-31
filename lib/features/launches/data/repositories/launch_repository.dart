import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/launches/data/datasources/launch_remote_datasource.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchRepository {
  final _remoteDatasource = LaunchRemoteDatasource();

  Future<List<Launch>> getAllLaunches() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    final launches = await _remoteDatasource.getAllLaunches();
    return launches;
  }

  List<Launch> getUpcomingLaunches() {
    return globalLaunchData.where((element) => element.upcoming).toList();
  }

  Future<Launch> getLaunchWithId(int id) async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    final launches = await _remoteDatasource.getLaunchWithId(id);
    return launches;
  }

}