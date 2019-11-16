import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/widgets/launch_countdown_card.dart';
import 'package:spacex_guide/widgets/launch_list_tile.dart';

class LaunchList extends StatelessWidget {
  LaunchList({this.launches, this.showNextLaunch});

  final List<Launch> launches;
  final bool showNextLaunch;

  @override
  Widget build(BuildContext context) {
    final nextLaunch = showNextLaunch ? getNextLaunch(launches) : null;

    return Container(
      color: Colors.black87,
      child: ListView.builder(
        itemCount: nextLaunch == null ? launches.length : launches.length + 1, // +1 for next launch card
        itemBuilder: (context, i) {
          if (i == 0 && nextLaunch != null) {
            return LaunchCountdownCard(launch: nextLaunch);
          }

          final launch = nextLaunch == null ? launches[i] : launches[i - 1];
          return LaunchListTile(launch: launch);
        },
      ),
    );
  }

  /// Filters [_launches] by upcoming, timed launches and sorts them by date to return the upcoming launch.
  Launch getNextLaunch(List<Launch> launches) {
    List<Launch> upcoming = launches.where((l) => (l.isUpcoming() && !l.isTentative)).toList();
    upcoming.sort((l1, l2) => l1.launchDateUnix.compareTo(l2.launchDateUnix));
    return upcoming.isEmpty ? null : upcoming[0];
  }
}