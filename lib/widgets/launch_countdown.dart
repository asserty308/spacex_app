import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';

class LaunchCountdown extends StatefulWidget {
  LaunchCountdown({
    this.launch,
  });

  Launch launch;

  @override
  _LaunchCountdownState createState() => _LaunchCountdownState();
}

class _LaunchCountdownState extends State<LaunchCountdown> {
  Timer _launchTimer;
  var _countdownText = '';

  @override
  void initState() {
    super.initState();
    startUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _countdownText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void dispose() {
    _launchTimer.cancel();
    super.dispose();
  }

  /// Update every second
  void startUpdate() {
    final duration = Duration(seconds: 1);
    _launchTimer = Timer.periodic(duration, (timer) {
      setCountdownText();
    });
  }

  void setCountdownText() {
    final seconds = (widget.launch.launchDateUnix - (DateTime.now().millisecondsSinceEpoch / 1000)).toInt();
    final minutes = seconds ~/ 60; // equal to (seconds / 60).toInt() but more efficient
    final hours = minutes ~/ 60;
    final days = hours ~/ 24;

    setState(() {
      _countdownText = 'T-${days}d:${hours % 24}h:${minutes % 60}m:${seconds % 60}s';
    });
  }
}