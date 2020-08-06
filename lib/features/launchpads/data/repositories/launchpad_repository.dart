import 'package:spacex_guide/features/launchpads/data/datasource/local/launchpads_local_datasource.dart';
import 'package:spacex_guide/features/launchpads/data/datasource/remote/launchpads_remote_datasource.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';

class LaunchpadRepository {
  final _remoteDatasource = LaunchpadRemoteDatasource();

  Future<List<LaunchpadModel>> getAllLaunchpads() async {
    if (LaunchpadsLocalDatasource.allLaunchpads != null && LaunchpadsLocalDatasource.allLaunchpads.isNotEmpty) {
      return LaunchpadsLocalDatasource.allLaunchpads;
    }

    LaunchpadsLocalDatasource.allLaunchpads = await _remoteDatasource.getAllLaunchpads();
    return LaunchpadsLocalDatasource.allLaunchpads;
  }

  Future<LaunchpadModel> getLaunchpad(String id) async {
    if (LaunchpadsLocalDatasource.allLaunchpads != null && LaunchpadsLocalDatasource.allLaunchpads.isNotEmpty) {
      return LaunchpadsLocalDatasource.allLaunchpads.firstWhere((element) => element.id == id);
    }

    return await _remoteDatasource.getLaunchpad(id);
  }
}