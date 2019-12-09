import 'package:flutter/material.dart';
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
        !launch.upcoming ? LaunchDetailActions(launch: launch,) : LaunchCountdownCard(launch: launch),
        const SizedBox(height: 8,),
        ListTile(
          title: Text(
            launch.missionName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            launch.formattedLaunchDate(),
            style: const TextStyle(
              color: Colors.white,
              height: 1.2,
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'Launch Site',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            launch.launchSiteName,
            style: const TextStyle(
              color: Colors.white,
              height: 1.2,
              fontSize: 16,
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
              height: 1.2,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8,),
        launch.details == null ? Container() : ListTile(
          title: const Text(
            'Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              launch.details,
              style: const TextStyle(
                  color: Colors.white,
                  height: 1.2,
                  fontSize: 16,
                ),
            ),
          ),
        ),
      ],
    );
  }
}