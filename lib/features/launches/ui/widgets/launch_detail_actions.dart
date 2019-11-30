import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_detail_action_button.dart';

class LaunchDetailActions extends StatelessWidget {
  const LaunchDetailActions({
    Key key,
    this.launch,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        LaunchDetailActionButton(
          icon: Icon(Icons.ondemand_video), 
          onTap: playVideo,
        ),
        LaunchDetailActionButton(
          icon: Icon(Icons.insert_drive_file), 
          onTap: showPresskit,
        ),
      ],
    );
  }

  void playVideo() {

  }

  void showPresskit() {

  }
}