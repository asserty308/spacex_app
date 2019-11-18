import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:spacex_guide/core/api/spacex_api.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class AllRocketsBloc {
  final _api = SpaceXAPI();
  final _rocketFetcher = PublishSubject<List<Rocket>>();

  Observable<List<Rocket>> get allRockets => _rocketFetcher.stream;

  Future<void> fetchAllRockets() async {
    final rockets = await _api.getAllRockets();
    _rocketFetcher.sink.add(rockets);
  }

  void dispose() {
    _rocketFetcher.close();
  }
}