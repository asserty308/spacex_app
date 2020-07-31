import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/ui/screens/launch_detail_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/launches_screen.dart';

class LaunchesMasterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocConsumer<LaunchesNavigationCubit, LaunchesNavigationState>(
    listener: (context, state) {
      if (state is LaunchesNavigationStateDetails) {
        Navigator.of(state.navContext).push(PageRouteBuilder(pageBuilder: (c, a1, a2) => LaunchDetailScreen(state.launch)));
      }
    },
    builder: (context, state) => LaunchesScreen(),
  );
}