import 'package:flutter/material.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/center_text.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/launchpads/ui/widgets/launchpad_card.dart';

class LaunchpadList extends StatefulWidget {
  const LaunchpadList({
    Key key,
  }) : super(key: key);

  @override
  _LaunchpadListState createState() => _LaunchpadListState();
}

class _LaunchpadListState extends State<LaunchpadList> {
  
  @override
  Widget build(BuildContext context) {
    return globalLaunchpadData.isNotEmpty ? buildList(globalLaunchpadData) : CenterText(
      'Something went wrong. Please try again later',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildList(List<Launchpad> launchpads) {
    return ListView.builder(
      itemCount: launchpads.length,
      itemBuilder: (context, i) {
        final launchpad = launchpads[i];
        return LaunchpadCard(launchpad: launchpad,);
      }
    );
  }
}