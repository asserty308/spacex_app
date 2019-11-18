import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchCountdown extends StatefulWidget {
  const LaunchCountdown({
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
    final h24 = hours % 24;
    final m60 = minutes % 60;
    final s60 = seconds % 60;

    // formatting
    final d = days < 10 ? '0$days' : '$days';
    final h = h24 < 10 ? '0$h24' : '$h24';
    final m = m60 < 10 ? '0$m60' : '$m60';
    final s = s60 < 10 ? '0$s60' : '$s60';

    setState(() {
      _countdownText = 'T-${d}d:${h}h:${m}m:${s}s';
    });
  }
}