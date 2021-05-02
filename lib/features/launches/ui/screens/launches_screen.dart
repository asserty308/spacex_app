import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/services/alerts.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/ui/widgets/sliver_app_scaffold.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/previous_launch_list.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/upcoming_launch_list.dart';

// TODO: Apply Glassmorphism design (blur bg and glass containers)

class LaunchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SliverAppScaffold(
    title: _title,
    actions: [
      _searchButton,
      _toggleLaunchesButton,
    ],
    body: _body,
  );

  final LaunchListCubit _cubit = GetIt.I<LaunchListCubit>();

  Widget get _body => BlocConsumer(
    bloc: _cubit..loadUpcomingLaunches(),
    listener: (context, dynamic state) {
      if (state is LaunchListStateError) {
        GetIt.I.get<AlertService>().showDismissDialog(context, 'Fehler', 'Leider können die Daten nicht geladen werden');
      }
    },
    builder: (context, dynamic state) {
      if (state is LaunchListStateLoading) {
        return SliverToBoxAdapter(child: CenterProgressIndicator());
      }

      if (state is LaunchListStateUpcomingLoaded) {
        return UpcomingLaunchList(
          scheduled: state.scheduled ?? [],
          nonScheduled: state.nonScheduled ?? [],
        );
      }

      if (state is LaunchListStatePreviousLoaded) {
        return PreviousLaunchList(
          launches: state.launches ?? [],
        );
      }

      return SliverToBoxAdapter(child: Container());
    }
  );

  // AppBar

  Widget get _title => BlocBuilder(
    bloc: _cubit,
    builder: (context, dynamic state) {
      var text = '';
      if (state is LaunchListStatePreviousLoaded) {
        text = 'Previous launches';
      }

      if (state is LaunchListStateUpcomingLoaded) {
        text = 'Upcoming launches';
      }

      return Text(text);
    },
  );

  Widget get _toggleLaunchesButton => BlocBuilder(
    bloc: _cubit,
    builder: (context, dynamic state) { 
      final isUpcoming = state is LaunchListStateUpcomingLoaded;
      final isPrevious = state is LaunchListStatePreviousLoaded;

      // Only show button when state is previous or upcoming
      if (!isUpcoming && !isPrevious) {
        return Container();
      }

      return IconButton(
        icon: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateY(isUpcoming ? 0 : pi),
          child: Icon(Icons.history)
        ),
        onPressed: () {
          if (isUpcoming) {
            GetIt.I<LaunchListCubit>().loadPreviousLaunches();
            return;
          }

          GetIt.I<LaunchListCubit>().loadUpcomingLaunches();
        }
      );
    }
  );

  Widget get _searchButton => BlocBuilder(
    bloc: _cubit,
    builder: (context, dynamic state) {
      List<LaunchModel>? launches = [];

      if (state is LaunchListStatePreviousLoaded) {
        launches = state.launches;
      }

      if (state is LaunchListStateUpcomingLoaded) {
        launches = List.from(state.scheduled ?? []);
        launches.addAll(state.nonScheduled ?? []);
      }

      if (launches?.isEmpty ?? true) {
        return Container();
      }

      return IconButton(
        icon: Icon(Icons.search),
        onPressed: () => showLaunchSearch(context, launches),
      );
    }
  );

  // Functions

  // TODO: Fix search for SliverAppBar
  void showLaunchSearch(BuildContext context, List<LaunchModel>? launches) => GetIt.I.get<AlertService>().showDismissDialog(
    context, 
    'Under construction', 
    'The search is temporarily unavailable.'
  );
}