import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/core/data/services/network_info.dart';
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
    final launches = globalLaunchData.where((element) => element.upcoming).toList();
    launches.sort((l1, l2) => l1.launchDate.compareTo(l2.launchDate));
    return launches;
  }

  List<Launch> getPreviousLaunches() {
    return globalLaunchData.where((element) => !element.upcoming).toList().reversed.toList();
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