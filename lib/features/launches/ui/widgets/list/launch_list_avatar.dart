import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchListAvatar extends StatelessWidget {
  const LaunchListAvatar({
    Key key, 
    this.launch
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      '${launch.flightNumber}',
      style: const TextStyle(color: Colors.white),
    );

    return CircleAvatar(
      child: launch.missionPatch == null ? text : Image.network(
        launch.missionPatch,
      ),
      backgroundColor: launch.missionPatch == null ? Colors.white24 : Colors.transparent,
    );
  }
}