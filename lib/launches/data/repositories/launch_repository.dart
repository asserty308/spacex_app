import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:spacex_guide/launches/data/datasources/local/launches_local_datasource.dart';
import 'package:spacex_guide/launches/data/datasources/remote/launch_remote_datasource.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';

class LaunchRepository {
  final LaunchApi launchRemoteDatasource = GetIt.I<LaunchApi>();

  Future<List<LaunchModel>?> getAllLaunches() async {
    if (LaunchesLocalDS.allLaunches != null && LaunchesLocalDS.allLaunches!.isNotEmpty) {
      return LaunchesLocalDS.allLaunches;
    }

    // TODO: Offline handling (local datasource with cached data)

    // final connected = await NetworkInfo.isConnected;

    // if (!connected) {
    //   throw Exception('App is not connected to the internet');
    // }

    LaunchesLocalDS.allLaunches = await launchRemoteDatasource.getAllLaunches();
    return LaunchesLocalDS.allLaunches;
  }

  Future<List<LaunchModel>?> getUpcomingLaunches() async {
    final all = await getAllLaunches();
    final launches = all?.where((element) => element.upcoming!).toList();
    launches?.sort((l1, l2) => l1.date!.compareTo(l2.date!));
    return launches;
  }

  Future<List<LaunchModel>?> getPreviousLaunches() async {
    final all = await getAllLaunches();
    return all?.where((element) => !element.upcoming!).toList().reversed.toList();
  }

  Future<LaunchModel> getLaunchWithId(int? id) async {
    final launches = await launchRemoteDatasource.getLaunchWithId(id);
    return launches;
  }

}