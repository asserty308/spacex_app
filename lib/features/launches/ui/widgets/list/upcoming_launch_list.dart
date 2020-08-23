import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_countdown_card.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list_tile.dart';
import 'package:flutter_core/ui/extensions/widget_extension.dart';

class UpcomingLaunchList extends StatelessWidget {
  const UpcomingLaunchList({
    Key key,
    @required this.scheduled,
    @required this.nonScheduled,
  }) : super(key: key);

  final List<LaunchModel> scheduled, nonScheduled;

  @override
  Widget build(BuildContext context) {
    final nextLaunch = getNextLaunch(scheduled);

    return Container(
      child: _listView(nextLaunch),
    );
  }

  // Widgets

  Widget _listView(LaunchModel nextLaunch) {
    final scheduledCount = scheduled == null || scheduled.isEmpty ? 0 : scheduled.length + 1;  // +1 for section header
    final nonScheduledCount = nonScheduled == null || nonScheduled.isEmpty ? 0 : nonScheduled.length + 1;  // +1 for section header
    final itemCount = scheduledCount + nonScheduledCount;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0 && nextLaunch != null) {
            return LaunchCountdownCard(launch: nextLaunch, showLaunchOnTap: true,);
          }

          final correctIndex = nextLaunch == null ? index : index - 1;

          if (correctIndex == 0) {
            return Text('Scheduled', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),).centered.paddingAll(24);
          }

          if (correctIndex < scheduledCount) {
            final launch = scheduled[correctIndex - 1];
            return LaunchListTile(launch: launch);
          }

          if (correctIndex == scheduledCount) {
            return Text('Not scheduled', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),).centered.paddingAll(24);
          }

          if (correctIndex > scheduledCount) {
            final launch = nonScheduled[correctIndex - scheduledCount - 1];
            return LaunchListTile(launch: launch);
          }

          return Container();
        },
        childCount: nextLaunch == null ? itemCount : itemCount + 1, // +1 for next launch card
      )
    );
  }

  // Functions

  /// Filters [_launches] by upcoming, timed launches and sorts them by date to return the upcoming launch.
  LaunchModel getNextLaunch(List<LaunchModel> launches) {
    final upcoming = launches.where((l) => l.upcoming && l.datePrecision == DatePrecision.day || l.datePrecision == DatePrecision.hour).toList();
    upcoming.sort((l1, l2) => l1.date.compareTo(l2.date));
    return upcoming.isEmpty ? null : upcoming[0];
  }
}