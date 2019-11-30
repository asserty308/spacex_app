import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';

class LaunchDetailsDescription extends StatelessWidget {
  const LaunchDetailsDescription({
    Key key,
    this.launch,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        color: Colors.indigo,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              launch.details,
              style: TextStyle(
                color: Colors.white,
                height: 1.2,
                fontSize: 16,
              ),
            ),
          ),
        )
      )
    );
  }
}