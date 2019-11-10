import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/screens/all_launches_screen.dart';
import 'package:spacex_guide/utility/navigation.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      "assets/RocketLaunch.flr", 
      animation: "launch",
      fit: BoxFit.cover,
      callback: (animation) {
        // animation finished => show first screen
        showScreen(context, AllLaunchesScreen());
      },
    );
  }
}