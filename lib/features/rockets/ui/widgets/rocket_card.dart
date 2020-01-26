import 'package:flutter/material.dart';
import 'package:flutter_core/ui/widgets/center_text.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class RocketCard extends StatelessWidget {
  RocketCard({
    Key key,
    this.rocket
  }) : super(key: key);

  final Rocket rocket;

  final _titleStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 2.0,
        color: Colors.black26,
        offset: const Offset(1.0, 1.0),
      ),
    ]
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      elevation: 1.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Image.network(
            rocket.flickrImages[0],
            fit: BoxFit.cover,
          ),
          // Alpha layer
          Container(
            color: const Color.fromARGB(20, 0, 0, 0),
          ),
          // Title
          CenterText(
            rocket.name,
            style: _titleStyle,
          ),
        ]
      )
    );
  }
}