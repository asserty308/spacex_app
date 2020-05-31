import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/upcoming/upcoming_launches_events.dart';
import 'package:spacex_guide/features/launches/bloc/upcoming/upcoming_launches_states.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';

class UpcomingLaunchesBloc extends Bloc<UpcomingLaunchesEvent, UpcomingLaunchesState> {
  final _repo = LaunchRepository();

  @override
  UpcomingLaunchesState get initialState => UpcomingLaunchesStateInitial();

  @override
  Stream<UpcomingLaunchesState> mapEventToState(UpcomingLaunchesEvent event) async* {
    if (event is LoadUpcomingLaunches) {
      yield* _mapLoadUpcomingLaunchesToState(event);
    }
  }

  Stream<UpcomingLaunchesState> _mapLoadUpcomingLaunchesToState(LoadUpcomingLaunches event) async* {
    yield UpcomingLaunchesStateLoading();

    final upcoming = _repo.getUpcomingLaunches();

    yield UpcomingLaunchesStateLoaded(upcoming);
  }
  
}