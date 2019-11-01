import 'package:flutter/material.dart';
import 'package:spacex_guide/screens/next_launch_screen.dart';
import 'package:spacex_guide/screens/past_launch_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ranking App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => PastLaunchScreen(),
      },
    );
  }
}