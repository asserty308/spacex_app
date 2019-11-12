import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/screens/launch_detail_screen.dart';
import 'package:spacex_guide/utility/navigation.dart';

import 'launch_countdown.dart';

class NextLaunchCard extends StatelessWidget {
  const NextLaunchCard({
    Key key,
    @required this.nextLaunch,
  }) : super(key: key);

  final Launch nextLaunch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        color: Colors.indigo,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  '${nextLaunch.missionName} will launch in', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 8,),
                LaunchCountdown(
                  launch: nextLaunch,
                  textSize: 22,
                ),
              ],
            ),
          ),
          onTap: () => showScreen(context, LaunchDetailScreen(nextLaunch)),
        ),
      ),
    );
  }
}