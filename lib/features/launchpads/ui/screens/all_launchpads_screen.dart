import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/features/launchpads/ui/widgets/launchpad_list.dart';

class AllLaunchpadsScreen extends StatefulWidget {
  @override
  _AllLaunchpadsScreenState createState() => _AllLaunchpadsScreenState();
}

class _AllLaunchpadsScreenState extends State<AllLaunchpadsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: const Text('All Launchpads'),
      body: Container(
        child: const LaunchpadList(),
      )
    );
  }
}