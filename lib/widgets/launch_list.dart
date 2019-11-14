import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/bloc/all_launches_bloc.dart';
import 'package:spacex_guide/widgets/launch_countdown_card.dart';
import 'package:spacex_guide/widgets/launch_list_tile.dart';

class LaunchList extends StatefulWidget {
  const LaunchList({
    Key key,
  }) : super(key: key);

  @override
  _LaunchListState createState() => _LaunchListState();
}

class _LaunchListState extends State<LaunchList> {
  final _bloc = AllLaunchesBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchAllLaunches();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.allLaunches,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot);
        }

        return Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Widget buildList(AsyncSnapshot<List<Launch>> snapshot) {
    final launches = snapshot.data;
    final nextLaunch = getNextLaunch(launches);

    return ListView.builder(
      itemCount: nextLaunch == null ? launches.length : launches.length + 1, // +1 for next launch card
      itemBuilder: (context, i) {
        if (i == 0 && nextLaunch != null) {
          return LaunchCountdownCard(launch: nextLaunch);
        }

        final launch = nextLaunch == null ? launches[i] : launches[i - 1];
        return LaunchListTile(launch: launch);
      },
    );
  }

  /// Filters [_launches] by upcoming, timed launches and sorts them by date to return the upcoming launch.
  Launch getNextLaunch(List<Launch> launches) {
    List<Launch> upcoming = launches.where((l) => (l.isUpcoming() && !l.isTentative)).toList();
    upcoming.sort((l1, l2) => l1.launchDateUnix.compareTo(l2.launchDateUnix));
    return upcoming.isEmpty ? null : upcoming[0];
  }
}