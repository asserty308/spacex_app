import 'package:flutter/material.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';

class LaunchListAvatar extends StatelessWidget {
  const LaunchListAvatar({
    super.key, 
    required this.launch
  });

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      '${launch.flightNumber}',
      style: const TextStyle(color: Colors.white),
    );

    final patch = launch.links?.patchSmall;
    
    return CircleAvatar(
      backgroundColor: patch == null ? Colors.white24 : Colors.transparent,
      child: patch == null ? text : Image.network(patch),
    );
  }
}