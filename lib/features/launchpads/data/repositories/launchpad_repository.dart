import 'package:spacex_guide/features/launchpads/data/datasource/local/launchpads_local_datasource.dart';
import 'package:spacex_guide/features/launchpads/data/datasource/remote/launchpads_remote_datasource.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:meta/meta.dart';

class LaunchpadRepository {
  final LaunchpadApi launchpadRemoteDatasource;

  LaunchpadRepository({
    @required this.launchpadRemoteDatasource,
  });

  Future<List<LaunchpadModel>> getAllLaunchpads() async {
    if (LaunchpadsLocalDatasource.allLaunchpads != null && LaunchpadsLocalDatasource.allLaunchpads.isNotEmpty) {
      return LaunchpadsLocalDatasource.allLaunchpads;
    }

    LaunchpadsLocalDatasource.allLaunchpads = await launchpadRemoteDatasource.getAllLaunchpads();
    return LaunchpadsLocalDatasource.allLaunchpads;
  }

  Future<LaunchpadModel> getLaunchpad(String id) async {
    if (LaunchpadsLocalDatasource.allLaunchpads != null && LaunchpadsLocalDatasource.allLaunchpads.isNotEmpty) {
      return LaunchpadsLocalDatasource.allLaunchpads.firstWhere((element) => element.id == id);
    }

    return await launchpadRemoteDatasource.getLaunchpad(id);
  }
}