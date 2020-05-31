import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_states.dart';
import 'package:spacex_guide/features/launches/ui/screens/launch_detail_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/upcoming_launches_screen.dart';

class LaunchesMasterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _blocProvider;
  }

  // Widgets

  Widget get _blocProvider => BlocProvider<LaunchesNavigationBloc>(
    create: (context) => LaunchesNavigationBloc(),
    child: _blocBuilder,
  );

  Widget get _blocBuilder => BlocBuilder<LaunchesNavigationBloc, LaunchesNavigationState>(
    builder: (context, state) {
      if (state is LaunchesNavigationStateUpcoming) {
        return UpcomingLaunchesScreen();
      }

      if (state is LaunchesNavigationStatePrevious) {
        return Container();
      }

      if (state is LaunchesNavigationStateDetails) {
        return LaunchDetailScreen(state.launch);
      }

      return Container();
    },
  );
}