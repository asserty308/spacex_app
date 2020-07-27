import 'package:spacex_guide/core/data/services/network_info.dart';
import 'package:spacex_guide/features/rockets/data/datasources/rockets_remote_datasource.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class RocketsRepository {
  final _remoteDatasource = RocketsRemoteDatasource();

  Future<List<Rocket>> getAllRockets() async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    return _remoteDatasource.getAllRockets();
  }

  Future<Rocket> getRocket(String id) async {
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    return _remoteDatasource.getRocket(id);
  }
}