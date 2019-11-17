import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex_guide/features/launches/domain/entities/launch.dart';

class AllLaunchesBloc {
  final _repo = LaunchRepository();
  final _launchesFetcher = PublishSubject<List<Launch>>();

  Observable<List<Launch>> get allLaunches => _launchesFetcher.stream;

  void fetchAllLaunches() async {
    var launches = await _repo.getAllLaunches();
    _launchesFetcher.sink.add(launches);
  }

  void dispose() {
    _launchesFetcher.close();
  }
}