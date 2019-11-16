import 'package:flutter/material.dart';
import 'package:spacex_guide/core/utility/navigation.dart';
import 'package:spacex_guide/features/launches/domain/entities/launch.dart';
import 'package:spacex_guide/features/launches/ui/pages/launch_detail_screen.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_countdown.dart';

class LaunchCountdownCard extends StatelessWidget {
  const LaunchCountdownCard({
    Key key,
    @required this.launch,
  }) : super(key: key);

  final Launch launch;

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
                  '${launch.missionName} will launch in', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 8,),
                LaunchCountdown(
                  launch: launch,
                  textSize: 22,
                ),
              ],
            ),
          ),
          onTap: () => showScreen(context, LaunchDetailScreen(launch)),
        ),
      ),
    );
  }
}