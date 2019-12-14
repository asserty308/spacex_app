import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_events.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_states.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/core/ui/widgets/progress_indicator.dart';
import 'package:spacex_guide/core/utility/notifications.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/screens/delegates/launch_search_delegate.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_animation.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list.dart';

/// Indicator whether the splash screen should be displayed or not.
/// When the splash has been shown for the first time it should not reappear during the session.
/// This is needed because users can re-open the [AllLaunchesScreen] through the drawer.
var _showSplash = true;

class AllLaunchesScreen extends StatefulWidget {
  @override
  _AllLaunchesScreenState createState() => _AllLaunchesScreenState();
}

class _AllLaunchesScreenState extends State<AllLaunchesScreen> {
  final _bloc = AllDataBloc();

  @override
  void initState() {
    super.initState();

    // start fetching launches immediately
    //_bloc.add(GetAllData());
  }
  
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _showSplash ? 0 : 1,
      children: <Widget>[
        buildLaunchAnimation(),
        buildScaffold(context),
      ],
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Widget buildLaunchAnimation() {
    return LaunchAnimation(
      onFinished: () {
        _bloc.add(GetAllData());
        
        setState(() {
          _showSplash = false;
        });
      },
    );
  }

  Widget buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Launches'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showLaunchSearch(context),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: globalLaunchData.isEmpty ? buildWithBloc() : LaunchList(
        launches: globalLaunchData,
        showNextLaunch: true,
      ),
    );
  }

  /// Builds the body of the scaffold by taking the current bloc state into account.
  Widget buildWithBloc() {
    return Container(
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is AllDataEmpty || state is AllDataLoading) {
            return MyProgressIndicator();
          }

          if (state is AllDataLoaded) {
            // Schedule notifications for all upcoming launches
            scheduleReminders(context, globalLaunchData);

            return LaunchList(
              launches: globalLaunchData,
              showNextLaunch: true,
            );
          }

          if (state is AllDataError) {
            return const Center(
              child: Text(
                'Something went wrong. Please try again later',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          // no state
          return Container();
        },
      ),
    );
  }

  void showLaunchSearch(BuildContext context) {
    showSearch<Launch>(
      context: context,
      delegate: LaunchSearchDelegate(
        launchData: globalLaunchData,
      ),
    );
  }
}