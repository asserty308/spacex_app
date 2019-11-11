import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/api/spacex_api.dart';

class AllLaunchesBloc {
  final _api = SpaceXAPI();
  final _launchesFetcher = PublishSubject<List<Launch>>();

  Observable<List<Launch>> get allLaunches => _launchesFetcher.stream;

  void fetchAllLaunches() async {
    var launches = await _api.getAllLaunches();
    _launchesFetcher.sink.add(launches);
  }

  void dispose() {
    _launchesFetcher.close();
  }
}