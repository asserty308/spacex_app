import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_events.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_states.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  @override
  AppNavigationState get initialState => AppNavigationStateSplash();

  @override
  Stream<AppNavigationState> mapEventToState(AppNavigationEvent event) async* {
    if (event is ShowSplash) {
      yield* _mapShowSplashToState(event);
    } else if (event is ShowUpcomingLaunches) {
      yield* _mapShowUpcomingLaunchesToState(event);
    } else if (event is ShowPreviousLaunches) {
      yield* _mapShowPreviousLaunchesToState(event);
    } else if (event is ShowRockets) {
      yield* _mapShowRocketsToState(event);
    } else if (event is ShowHistory) {
      yield* _mapShowHistoryToState(event);
    }
  }

  Stream<AppNavigationState> _mapShowSplashToState(ShowSplash event) async* {
    yield AppNavigationStateSplash();
  }

  Stream<AppNavigationState> _mapShowUpcomingLaunchesToState(ShowUpcomingLaunches event) async* {
    yield AppNavigationStateUpcomingLaunches();
  }

  Stream<AppNavigationState> _mapShowPreviousLaunchesToState(ShowPreviousLaunches event) async* {
    yield AppNavigationStatePreviousLaunches();
  }

  Stream<AppNavigationState> _mapShowRocketsToState(ShowRockets event) async* {
    yield AppNavigationStateRockets();
  }

  Stream<AppNavigationState> _mapShowHistoryToState(ShowHistory event) async* {
    yield AppNavigationStateHistory();
  }

}