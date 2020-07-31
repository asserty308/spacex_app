import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_cubit.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_events.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_states.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/screens/delegates/launch_search_delegate.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list.dart';

class LaunchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => LaunchListBloc()..add(LoadUpcomingLaunches()),
    child: _scaffold(context),
  );

  // Widgets

  Widget _scaffold(BuildContext context) => Scaffold(
    appBar: _appBar(context),
    drawer: AppDrawer(),
    body: _body,
  );

  Widget _appBar(BuildContext context) => AppBar(
    title: _title,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () => showLaunchSearch(context),
      ),
      _toggleLaunchesButton,
    ],
  );

  Widget get _body => BlocConsumer<LaunchListBloc, LaunchListState>(
    listener: (context, state) {
      if (state is LaunchListStateError) {
        showOKDialog(context, 'Fehler', 'Leider können die Daten nicht geladen werden');
      }
    },
    builder: (context, state) {
      if (state is LaunchListStateLoading) {
        return CenterProgressIndicator();
      }

      if (state is LaunchListStateUpcomingLoaded) {
        return LaunchList(
          launches: state.launches,
          showNextLaunch: true,
        );
      }

      if (state is LaunchListStatePreviousLoaded) {
        return LaunchList(
          launches: state.launches,
          showNextLaunch: true,
        );
      }

      return Container();
    }
  );

  Widget get _toggleLaunchesButton => BlocBuilder<LaunchListBloc, LaunchListState>(
    builder: (context, state) { 
      final isUpcoming = state is LaunchListStateUpcomingLoaded;
      final isPrevious = state is LaunchListStatePreviousLoaded;

      // Only show button when state is previous or upcoming
      if (!isUpcoming && !isPrevious) {
        return Container();
      }

      return IconButton(
        icon: Icon(isUpcoming ? Icons.history : Icons.cloud_upload),
        onPressed: () => BlocProvider.of<LaunchListBloc>(context).add(isUpcoming ? LoadPreviousLaunches() : LoadUpcomingLaunches()),
      );
    }
  );

  Widget get _title => BlocBuilder<LaunchListBloc, LaunchListState>(
    builder: (context, state) {
      String text = '';
      if (state is LaunchListStatePreviousLoaded) {
        text = 'Previous launches';
      }

      if (state is LaunchListStateUpcomingLoaded) {
        text = 'Upcoming launches';
      }

      return Text(text);
    },
  );

  // Functions

  void showLaunchSearch(BuildContext context) {
    showSearch<Launch>(
      context: context,
      delegate: LaunchSearchDelegate(
        launchData: globalLaunchData,
      ),
    );
  }
}