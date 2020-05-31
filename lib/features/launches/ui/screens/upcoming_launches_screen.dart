import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/ui/dialogs.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/features/launches/bloc/upcoming/upcoming_launches_bloc.dart';
import 'package:spacex_guide/features/launches/bloc/upcoming/upcoming_launches_events.dart';
import 'package:spacex_guide/features/launches/bloc/upcoming/upcoming_launches_states.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/screens/delegates/launch_search_delegate.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list.dart';

class UpcomingLaunchesScreen extends StatefulWidget {
  @override
  _UpcomingLaunchesScreenState createState() => _UpcomingLaunchesScreenState();
}

class _UpcomingLaunchesScreenState extends State<UpcomingLaunchesScreen> {
  final _bloc = UpcomingLaunchesBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadUpcomingLaunches());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Launches'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showLaunchSearch(context),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _blocConsumer,
    );
  }

  // Widgets

  Widget get _blocConsumer => BlocConsumer(
    bloc: _bloc, 
    listener: (context, state) {
      if (state is UpcomingLaunchesStateError) {
        showOKDialog(context, 'Fehler', 'Leider können die Daten nicht geladen werden');
      }
    }, 
    builder: (context, state) {
      if (state is UpcomingLaunchesStateLoading) {
        return CenterProgressIndicator();
      }

      if (state is UpcomingLaunchesStateLoaded) {
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