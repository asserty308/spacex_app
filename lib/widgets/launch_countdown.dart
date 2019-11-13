import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/screens/launch_detail_screen.dart';
import 'package:spacex_guide/utility/navigation.dart';

class LaunchCountdown extends StatefulWidget {
  LaunchCountdown({
    this.launch,
    this.textColor = Colors.white,
    this.textSize = 25,
  });

  final Launch launch;
  final Color textColor;
  final double textSize;

  @override
  _LaunchCountdownState createState() => _LaunchCountdownState();
}

class _LaunchCountdownState extends State<LaunchCountdown> {
  Timer _launchTimer;
  var _countdownText = '';

  @override
  void initState() {
    super.initState();

    setCountdownText();
    startUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _countdownText,
      style: TextStyle(
        color: widget.textColor,
        fontSize: widget.textSize,
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
    // calculate raw time data
    final seconds = (widget.launch.launchDateUnix - (DateTime.now().millisecondsSinceEpoch / 1000)).toInt();
    final minutes = seconds ~/ 60; // equal to (seconds / 60).toInt() but more efficient
    final hours = minutes ~/ 60;
    final days = hours ~/ 24;

    // convert to time
    var h24 = hours % 24;
    var m60 = minutes % 60;
    var s60 = seconds % 60;

    // formatting
    var d = days < 10 ? '0$days' : '$days';
    var h = h24 < 10 ? '0$h24' : '$h24';
    var m = m60 < 10 ? '0$m60' : '$m60';
    var s = s60 < 10 ? '0$s60' : '$s60';

    setState(() {
      _countdownText = 'T-${d}d:${h}h:${m}m:${s}s';
    });
  }
}