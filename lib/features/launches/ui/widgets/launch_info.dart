import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/text_card.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_detail_actions.dart';

import 'launch_countdown_card.dart';

class LaunchInfo extends StatelessWidget {
  const LaunchInfo({
    Key key,
    this.launch
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        !launch.isUpcoming() ? LaunchDetailActions(launch: launch,) : LaunchCountdownCard(launch: launch),
        ListTile(
          title: const Text(
            'Date',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            launch.formattedLaunchDate(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'Rocket',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            launch.rocket.name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        launch.details != null ? TextCard(text: launch.details,) : Container(),
      ],
    );
  }
}