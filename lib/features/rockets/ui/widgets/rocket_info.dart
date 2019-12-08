import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/themes/default_theme.dart';
import 'package:spacex_guide/core/ui/widgets/text_card.dart';
import 'package:spacex_guide/features/launches/bloc/all_launches_bloc.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_list_tile.dart';
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
    final previousLaunches = allLaunchesData.where((l) => l.rocket.id == rocket.id && !l.upcoming).toList().reversed;

    final previousList = <Widget>[];
    for (final l in previousLaunches) {
      previousList.add(LaunchListTile(launch: l));
    }

    // filter all launches to find the current rocket's upcoming launches - show next launch first
    final upcomingLaunches = allLaunchesData.where((l) => l.rocket.id == rocket.id && l.upcoming).toList();

    final upcomingList = <Widget>[];
    for (final l in upcomingLaunches) {
      upcomingList.add(LaunchListTile(launch: l));
    }

    return ListView(
      children: <Widget>[
        TextCard(text: rocket.description,),
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