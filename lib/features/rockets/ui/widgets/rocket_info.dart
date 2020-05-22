import 'package:flutter/material.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/ui/themes/default_theme.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list_tile.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class RocketInfo extends StatelessWidget {
  const RocketInfo({
    Key key,
    this.rocket,
  }) : super(key: key);

  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    // filter all launches to find the current rocket's launch history - show latest launch first
    final previousLaunches = globalLaunchData.where((l) => l.rocket.id == rocket.id && !l.upcoming).toList().reversed;

    final previousList = <Widget>[];
    for (final l in previousLaunches) {
      previousList.add(LaunchListTile(launch: l));
    }

    // filter all launches to find the current rocket's upcoming launches - show next launch first
    final upcomingLaunches = globalLaunchData.where((l) => l.rocket.id == rocket.id && l.upcoming).toList();

    final upcomingList = <Widget>[];
    for (final l in upcomingLaunches) {
      upcomingList.add(LaunchListTile(launch: l));
    }

    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            rocket.name,
            style: Theme.of(context).textTheme.headline4.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              rocket.description,
              style: const TextStyle(
                color: Colors.white,
                height: 1.3,
                fontSize: 16,
              ),
            ),
          ),
        ),
        previousList.isEmpty && upcomingList.isEmpty ? Container() : Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
          child: Text(
            'Launches',
            style: Theme.of(context).textTheme.headline5.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Theme(
          data: defaultTheme.copyWith(
            accentColor: Colors.white, // arrow color when expanded
            unselectedWidgetColor: Colors.white // arrow color when closed
          ),
          child: previousList.isEmpty ? Container() : ExpansionTile(
            title: const Text(
              'Launch History',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            children: previousList,
          ),
        ),
        Theme(
          data: defaultTheme.copyWith(
            accentColor: Colors.white, // arrow color when expanded
            unselectedWidgetColor: Colors.white // arrow color when closed
          ),
          child: upcomingList.isEmpty ? Container() : ExpansionTile(
            title: const Text(
              'Upcoming Launches',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            children: upcomingList,
          ),
        )
      ],
    );
  }
}