import 'package:spacex_guide/features/rockets/data/datasources/local/rockets_local_datasource.dart';
import 'package:spacex_guide/features/rockets/data/datasources/remote/rockets_remote_datasource.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:meta/meta.dart';

class RocketRepository {
  RocketRepository({
    @required this.rocketsRemoteDatasource,
  });

  final RocketsApi rocketsRemoteDatasource;

  Future<List<RocketModel>> getAllRockets() async {
    if (RocketsLocalDatasource.allRockets != null && RocketsLocalDatasource.allRockets.isEmpty) {
      return RocketsLocalDatasource.allRockets;
    }

    RocketsLocalDatasource.allRockets = await rocketsRemoteDatasource.getAllRockets();
    return RocketsLocalDatasource.allRockets;
  }

  Future<RocketModel> getRocket(String id) async {
    if (RocketsLocalDatasource.allRockets != null && RocketsLocalDatasource.allRockets.isEmpty) {
      return RocketsLocalDatasource.allRockets.firstWhere((element) => element.id == id);
    }

    return rocketsRemoteDatasource.getRocket(id);
  }
}