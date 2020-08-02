import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_events.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_states.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';

class LaunchListBloc extends Bloc<LaunchListEvent, LaunchListState> {
  LaunchListBloc() : super(LaunchListStateInitial());

  final _repo = LaunchRepository();

  @override
  Stream<LaunchListState> mapEventToState(LaunchListEvent event) async* {
    if (event is LoadUpcomingLaunches) {
      yield* _mapLoadUpcomingLaunchesToState(event);
    }

    if (event is LoadPreviousLaunches) {
      yield* _mapLoadPreviousLaunchesToState(event);
    }
  }

  Stream<LaunchListState> _mapLoadUpcomingLaunchesToState(LoadUpcomingLaunches event) async* {
    yield LaunchListStateLoading();
    final upcoming = await _repo.getUpcomingLaunches();
    yield LaunchListStateUpcomingLoaded(upcoming);
  }

  Stream<LaunchListState> _mapLoadPreviousLaunchesToState(LoadPreviousLaunches event) async* {
    yield LaunchListStateLoading();
    final previous = await _repo.getPreviousLaunches();
    yield LaunchListStatePreviousLoaded(previous);
  }
  
}