import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_bloc.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/screens/delegates/launch_search_delegate.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list.dart';

class LaunchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => LaunchListBloc(
      launchRepository: RepositoryProvider.of(context),
    )..loadUpcomingLaunches(),
    child: _scaffold(context),
  );

  // Widgets

  Widget _scaffold(BuildContext context) => AppScaffold(
    title: _title,
    actions: [
      _seaerchButton,
      _toggleLaunchesButton,
    ],
    child: _body,
  );

  Widget get _seaerchButton => BlocBuilder<LaunchListBloc, LaunchListState>(
    builder: (context, state) {
      List<LaunchModel> launches = [];

      if (state is LaunchListStatePreviousLoaded) {
        launches = state.launches;
      }

      if (state is LaunchListStateUpcomingLoaded) {
        launches = state.launches;
      }

      if (launches == null || launches.isEmpty) {
        return Container();
      }

      return IconButton(
        icon: Icon(Icons.search),
        onPressed: () => showLaunchSearch(context, launches),
      );
    }
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
        onPressed: () {
          if (isUpcoming) {
            BlocProvider.of<LaunchListBloc>(context).loadPreviousLaunches();
            return;
          }

          BlocProvider.of<LaunchListBloc>(context).loadUpcomingLaunches();
        }
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

  void showLaunchSearch(BuildContext context, List<LaunchModel> launches) => showSearch<LaunchModel>(
    context: context,
    delegate: LaunchSearchDelegate(
      launchData: launches,
    ),
  );
}