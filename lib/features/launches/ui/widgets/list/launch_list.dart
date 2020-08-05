import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_countdown_card.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list_tile.dart';

class LaunchList extends StatelessWidget {
  const LaunchList({
    Key key,
    @required this.launches, 
    this.showNextLaunch = true,
  }) : super(key: key);

  final List<LaunchModel> launches;
  final bool showNextLaunch;

  @override
  Widget build(BuildContext context) {
    final nextLaunch = showNextLaunch ? getNextLaunch(launches) : null;

    return Container(
      child: _listView(nextLaunch),
    );
  }

  // Widgets

  Widget _listView(LaunchModel nextLaunch) => ListView.builder(
    itemCount: nextLaunch == null ? launches.length : launches.length + 1, // +1 for next launch card
    itemBuilder: (context, i) {
      if (i == 0 && nextLaunch != null) {
        return LaunchCountdownCard(launch: nextLaunch, showLaunchOnTap: true,);
      }

      final launch = nextLaunch == null ? launches[i] : launches[i - 1];
      return LaunchListTile(launch: launch);
    },
  );

  // Functions

  /// Filters [_launches] by upcoming, timed launches and sorts them by date to return the upcoming launch.
  LaunchModel getNextLaunch(List<LaunchModel> launches) {
    final upcoming = launches.where((l) => l.upcoming && l.datePrecision == DatePrecision.day || l.datePrecision == DatePrecision.hour).toList();
    upcoming.sort((l1, l2) => l1.date.compareTo(l2.date));
    return upcoming.isEmpty ? null : upcoming[0];
  }
}