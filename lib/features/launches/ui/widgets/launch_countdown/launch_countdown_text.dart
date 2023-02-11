part of 'launch_countdown_card.dart';

class LaunchCountdown extends StatefulWidget {
  const LaunchCountdown({Key? key, 
    required this.launch,
    this.textColor = Colors.white,
    this.textSize = 25,
  }) : super(key: key);

  final LaunchModel launch;
  final Color textColor;
  final double textSize;

  @override
  State<LaunchCountdown> createState() => _LaunchCountdownState();
}

class _LaunchCountdownState extends State<LaunchCountdown> {
  late Timer _launchTimer;
  var _countdownText = '';

  @override
  void initState() {
    super.initState();

    setCountdownText();
    startUpdate();
  }

  @override
  void dispose() {
    _launchTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Text(
    _countdownText,
    style: TextStyle(
      color: widget.textColor,
      fontSize: widget.textSize,
      fontWeight: FontWeight.bold,
    ),
  );
  
  /// Update every second
  void startUpdate() {
    _launchTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setCountdownText();
    });
  }

  void setCountdownText() {
    // calculate raw time data
    final seconds = ((widget.launch.date!.millisecondsSinceEpoch / 1000) - (DateTime.now().millisecondsSinceEpoch / 1000)).toInt();
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