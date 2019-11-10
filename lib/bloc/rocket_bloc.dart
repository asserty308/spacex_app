import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:spacex_guide/api/models/rocket.dart';
import 'package:spacex_guide/api/spacex_api.dart';

class RocketBloc {
  final _api = SpaceXAPI();
  final _rocketFetcher = PublishSubject<List<Rocket>>();

  Observable<List<Rocket>> get allRockets => _rocketFetcher.stream;

  void fetchAllRockets() async {
    var rockets = await _api.getAllRockets();
    _rocketFetcher.sink.add(rockets);
  }

  void dispose() {
    _rocketFetcher.close();
  }
}