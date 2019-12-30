import 'package:flutter/material.dart';
import 'package:flutter_core/utility/routing/routing.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/screens/launch_detail_screen.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_countdown.dart';

class LaunchCountdownCard extends StatelessWidget {
  const LaunchCountdownCard({
    Key key,
    @required this.launch,
    this.showLaunchOnTap,
  }) : super(key: key);

  final Launch launch;
  final bool showLaunchOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(8),
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
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 8,),
                LaunchCountdown(
                  launch: launch,
                  textSize: 22,
                ),
              ],
            ),
          ),
          onTap: () { 
            if (!showLaunchOnTap) {
              return;
            }
            
            showScreen(context, LaunchDetailScreen(launch)); 
          },
        ),
      ),
    );
  }
}