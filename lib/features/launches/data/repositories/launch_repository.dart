import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/launches/data/datasources/launch_remote_datasource.dart';
import 'package:spacex_guide/features/launches/domain/entities/launch.dart';
import 'package:spacex_guide/features/launches/domain/repositories/launch_repository_interface.dart';

class LaunchRepository implements LaunchRepositoryInterface {
  final remoteDatasource = LaunchRemoteDatasource();
  final networkInfo = NetworkInfo();

  @override
  Future<List<Launch>> getAllLaunches() async {
    final connected = await networkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling
      return [];
    }

    return remoteDatasource.getAllLaunches();
  }

}