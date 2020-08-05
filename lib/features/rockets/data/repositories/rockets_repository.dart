import 'package:spacex_guide/core/data/services/network_info.dart';
import 'package:spacex_guide/features/rockets/data/datasources/local/rockets_local_datasource.dart';
import 'package:spacex_guide/features/rockets/data/datasources/remote/rockets_remote_datasource.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class RocketRepository {
  final _remoteDatasource = RocketsRemoteDatasource();

  Future<List<RocketModel>> getAllRockets() async {
    if (RocketsLocalDatasource.allRockets != null && RocketsLocalDatasource.allRockets.isEmpty) {
      return RocketsLocalDatasource.allRockets;
    }

    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    RocketsLocalDatasource.allRockets = await _remoteDatasource.getAllRockets();
    return RocketsLocalDatasource.allRockets;
  }

  Future<RocketModel> getRocket(String id) async {
    if (RocketsLocalDatasource.allRockets != null && RocketsLocalDatasource.allRockets.isEmpty) {
      return RocketsLocalDatasource.allRockets.firstWhere((element) => element.id == id);
    }
    
    final connected = await NetworkInfo.isConnected;

    if (!connected) {
      // TODO: Offline handling (local datasource with cached data)
      throw Exception('App is not connected to the internet');
    }

    return _remoteDatasource.getRocket(id);
  }
}