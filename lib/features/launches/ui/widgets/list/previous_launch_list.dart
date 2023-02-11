import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list_tile.dart';

class PreviousLaunchList extends StatelessWidget {
  const PreviousLaunchList({
    super.key,
    required this.launches, 
  });

  final List<LaunchModel> launches;

  @override
  Widget build(BuildContext context) => Container(
    child: _listView(),
  );

  // Widgets

  Widget _listView() => SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) => LaunchListTile(launch: launches[index]),
      childCount: launches.length,
    )
  );
}