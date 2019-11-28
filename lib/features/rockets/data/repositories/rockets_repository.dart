import 'package:spacex_guide/core/error/error.dart';
import 'package:spacex_guide/core/network/network_info.dart';
import 'package:spacex_guide/features/rockets/data/datasources/rockets_remote_datasource.dart';

class RocketsRepository {
  final _remoteDatasource = RocketsRemoteDatasource();

  Future<dynamic> getAllRockets() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      return AppErrorNoNetwork();
    }

    final rockets = _remoteDatasource.getAllRockets();
    return rockets;
  }
}