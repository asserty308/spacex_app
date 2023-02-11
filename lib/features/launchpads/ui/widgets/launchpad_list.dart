import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/launchpads/ui/widgets/launchpad_card.dart';

class LaunchpadList extends StatelessWidget {
  const LaunchpadList({
    super.key, 
    required this.launchpads
  });

  final List<LaunchpadModel>? launchpads;

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: launchpads!.length,
    itemBuilder: (context, i) => LaunchpadCard(launchpad: launchpads![i]),
  );
}