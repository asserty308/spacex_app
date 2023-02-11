import 'package:flutter/material.dart';

class LaunchAnimation extends StatelessWidget {
  const LaunchAnimation({Key? key, this.onFinished}) : super(key: key);

  final Function? onFinished;

  @override
  Widget build(BuildContext context) => Container(
    // color: Colors.white,
    // child: FlareActor(
    //   'assets/RocketLaunch.flr', 
    //   animation: 'launch',
    //   fit: BoxFit.cover,
    //   callback: (animation) => onFinished!(),
    // ),
  );
}