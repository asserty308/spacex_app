import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchListAvatar extends StatelessWidget {
  const LaunchListAvatar({
    Key? key, 
    required this.launch
  }) : super(key: key);

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      '${launch.flightNumber}',
      style: const TextStyle(color: Colors.white),
    );

    final patch = launch.links!.patchSmall;
    
    return CircleAvatar(
      child: patch == null ? text : Image.network(patch),
      backgroundColor: patch == null ? Colors.white24 : Colors.transparent,
    );
  }
}