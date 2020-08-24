import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/launch_details/launch_details_cubit.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/screens/launch_detail_screen.dart';
import 'package:spacex_guide/features/launches/ui/screens/launches_screen.dart';

class LaunchesMasterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocConsumer<LaunchesNavigationCubit, LaunchesNavigationState>(
    listener: (context, state) {
      if (state is LaunchesNavigationStateDetails) {
        _showDetailsScreen(state.navContext, state.launch);
      }
    },
    builder: (context, state) => LaunchesScreen(
      launchListCubit: BlocProvider.of<LaunchListCubit>(context),
    ),
  );

  void _showDetailsScreen(BuildContext context, LaunchModel launch) => Navigator.of(context).push(
    PageRouteBuilder(pageBuilder: (c, a1, a2) => LaunchDetailScreen(
      launch: launch,
      launchDetailsCubit: BlocProvider.of<LaunchDetailsCubit>(context),
    ))
  );
}