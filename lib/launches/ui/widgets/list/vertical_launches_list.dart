import 'package:flutter/material.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';
import 'package:spacex_guide/launches/ui/widgets/list/launch_list_tile.dart';

class VerticalLaunchesList extends StatelessWidget {
  const VerticalLaunchesList({
    super.key, 
    required this.launches
  });

  final List<LaunchModel> launches;

  @override
  Widget build(BuildContext context) => ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: launches.length,
    itemBuilder: (context, index) {
      final launch = launches[index];
      return LaunchListTile(launch: launch);
    },
  );
}