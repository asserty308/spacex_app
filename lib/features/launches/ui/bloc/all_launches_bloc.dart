import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';
import 'package:bloc/bloc.dart';

enum AllLaunchesState {
  empty,
  loading,
  loaded,
  error
}

enum AllLaunchesEvent {
  getAllLaunches,
}

class AllLaunchesBloc extends Bloc<AllLaunchesEvent, AllLaunchesState> {
  final LaunchRepository _repo = LaunchRepository();
  final PublishSubject<List<Launch>> _launchesFetcher = PublishSubject<List<Launch>>();

  Observable<List<Launch>> get allLaunches => _launchesFetcher.stream;

  @override
  AllLaunchesState get initialState => AllLaunchesState.empty;

  @override
  Stream<AllLaunchesState> mapEventToState(AllLaunchesEvent event) async* {
    switch (event) {
      case AllLaunchesEvent.getAllLaunches:
        yield* _handleGetAllLaunches();
        break;
    }
  }

  @override
  Future<void> close() async {
    _launchesFetcher.close();
    super.close();
  }

  Stream<AllLaunchesState> _handleGetAllLaunches() async* {
    yield AllLaunchesState.loading;

    final List<Launch> launches = await _repo.getAllLaunches();

    if (launches == null || launches.isEmpty) {
      yield AllLaunchesState.error;
      return;
    }

    _launchesFetcher.sink.add(launches);
    yield AllLaunchesState.loaded;
  }
}