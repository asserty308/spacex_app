import 'package:flutter/material.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';
import 'package:spacex_guide/launches/ui/widgets/launch_countdown/launch_countdown_card.dart';
import 'package:spacex_guide/launches/ui/widgets/list/horizontal_launches_list.dart';
import 'package:spacex_guide/launches/ui/widgets/list/vertical_launches_list.dart';

class UpcomingLaunchList extends StatelessWidget {
  const UpcomingLaunchList({
    super.key,
    required this.scheduled,
    required this.nonScheduled,
  });

  final List<LaunchModel> scheduled, nonScheduled;

  @override
  Widget build(BuildContext context) {
    final nextLaunch = getNextLaunch(scheduled);
    return _listView(nextLaunch);
  }

  // Widgets

  Widget _listView(LaunchModel? nextLaunch) => SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        if (index == 0 && nextLaunch != null) {
          return LaunchCountdownCard(launch: nextLaunch, showLaunchOnTap: true,);
        }

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(child: Text('Scheduled', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),)),
            ),
            HorizontalLaunchesList(launches: scheduled),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(child: Text('Not scheduled', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),)),
            ),
            VerticalLaunchesList(launches: nonScheduled),
          ],
        );
      },
      childCount: nextLaunch == null ? 1 : 2,
    ),
  );

  // Functions

  /// Filters [launches] by upcoming, timed launches and sorts them by date to return the upcoming launch.
  LaunchModel? getNextLaunch(List<LaunchModel> launches) {
    final upcoming = launches.where((l) => (l.upcoming ?? false) && l.datePrecision == DatePrecision.day || l.datePrecision == DatePrecision.hour).toList();
    upcoming.sort((l1, l2) => l1.date!.compareTo(l2.date!));
    return upcoming.isEmpty ? null : upcoming[0];
  }
}