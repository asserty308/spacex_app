import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_countdown/launch_countdown_card.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/horizontal_launches_list.dart';
import 'package:flutter_core/ui/extensions/widget_extension.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/vertical_launches_list.dart';

class UpcomingLaunchList extends StatelessWidget {
  const UpcomingLaunchList({
    Key? key,
    required this.scheduled,
    required this.nonScheduled,
  }) : super(key: key);

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
            Text('Scheduled', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),).centered.paddingAll(24),
            HorizontalLaunchesList(launches: scheduled),
            Text('Not scheduled', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),).centered.paddingAll(24),
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