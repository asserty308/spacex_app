import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list_tile.dart';

class VerticalLaunchesList extends StatelessWidget {
  const VerticalLaunchesList({
    Key? key, 
    required this.launches
  }) : super(key: key);

  final List<LaunchModel> launches;

  @override
  Widget build(BuildContext context) => ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: launches.length,
    itemBuilder: (context, index) {
      final launch = launches[index];
      return LaunchListTile(launch: launch);
    },
  );
}