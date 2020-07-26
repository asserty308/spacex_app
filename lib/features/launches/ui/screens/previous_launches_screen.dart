import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_events.dart';
import 'package:spacex_guide/features/launches/bloc/launch_list/launch_list_states.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_events.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/screens/delegates/launch_search_delegate.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list.dart';

class PreviousLaunchesScreen extends StatefulWidget {
  @override
  _PreviousLaunchesScreenState createState() => _PreviousLaunchesScreenState();
}

class _PreviousLaunchesScreenState extends State<PreviousLaunchesScreen> {
  final _bloc = LaunchListBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadPreviousLaunches());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      drawer: MyDrawer(),
      body: _bodyConsumer,
    );
  }

  // Widgets

  Widget get _appBar => AppBar(
    title: const Text('Previous Launches'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () => showLaunchSearch(context),
      ),
      IconButton(
        icon: Icon(Icons.local_activity),
        onPressed: () => BlocProvider.of<LaunchesNavigationBloc>(context).add(ShowUpcomingLaunches()),
      ),
    ],
  );

  Widget get _bodyConsumer => BlocConsumer(
    cubit: _bloc, 
    listener: (context, state) {
      if (state is LaunchListStateError) {
        showOKDialog(context, 'Fehler', 'Leider können die Daten nicht geladen werden');
      }
    },
    builder: (context, state) {
      if (state is LaunchListStateLoading) {
        return CenterProgressIndicator();
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