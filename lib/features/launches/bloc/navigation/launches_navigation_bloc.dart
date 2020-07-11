import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_events.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_states.dart';

class LaunchesNavigationBloc extends Bloc<LaunchesNavigationEvent, LaunchesNavigationState> {
  final _eventHistory = <LaunchesNavigationEvent>[];

  @override
  LaunchesNavigationState get initialState => LaunchesNavigationStateUpcoming();

  @override
  Stream<LaunchesNavigationState> mapEventToState(LaunchesNavigationEvent event) async* {
    _eventHistory.add(event);

    if (event is ShowUpcomingLaunches) {
      yield* _mapShowUpcomingLaunchesToState(event);
    }

    if (event is ShowPreviousLaunches) {
      yield* _mapShowPreviousLaunchesToState(event);
    }

    if (event is ShowLaunchDetails) {
      yield* _mapShowLaunchDetailsToState(event);
    }
  }

  Stream<LaunchesNavigationState> _mapShowUpcomingLaunchesToState(ShowUpcomingLaunches event) async* {
    yield LaunchesNavigationStateUpcoming();
  }

  Stream<LaunchesNavigationState> _mapShowPreviousLaunchesToState(ShowPreviousLaunches event) async* {
    yield LaunchesNavigationStatePrevious();
  }

  Stream<LaunchesNavigationState> _mapShowLaunchDetailsToState(ShowLaunchDetails event) async* {
    yield LaunchesNavigationStateDetails(event.navContext, event.launch);
  }

  void popState() {
    _eventHistory.removeLast();

    if (_eventHistory.isEmpty) {
      add(ShowUpcomingLaunches());
      return;
    }

    add(_eventHistory.last);
  }

}