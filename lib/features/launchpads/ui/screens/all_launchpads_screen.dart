import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/features/launchpads/ui/widgets/launchpad_list.dart';

class AllLaunchpadsScreen extends StatefulWidget {
  @override
  _AllLaunchpadsScreenState createState() => _AllLaunchpadsScreenState();
}

class _AllLaunchpadsScreenState extends State<AllLaunchpadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Launchpads'),
      ),
      drawer: const MyDrawer(),
      body: Container(
        child: const LaunchpadList(),
      )
    );
  }
}