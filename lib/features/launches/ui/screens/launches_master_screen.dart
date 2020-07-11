import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/routing/routing.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_states.dart';
import 'package:spacex_guide/features/launches/ui/screens/launch_detail_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/previous_launches_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/upcoming_launches_screen.dart';

class LaunchesMasterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _blocBuilder;
  }

  // Widgets

  Widget get _blocBuilder => BlocConsumer<LaunchesNavigationBloc, LaunchesNavigationState>(
    listener: (context, state) {
      if (state is LaunchesNavigationStateDetails) {
        // TODO: showScreen does not word here - only when calling directly from the screen itself
        Navigator.of(state.navContext).push(MaterialPageRoute(builder: (_) => LaunchDetailScreen(state.launch)));
      }
    },
    builder: (context, state) {
      if (state is LaunchesNavigationStateUpcoming) {
        return UpcomingLaunchesScreen();
      }

      if (state is LaunchesNavigationStatePrevious) {
        return PreviousLaunchesScreen();
      }

      return Container();
    },
  );
}