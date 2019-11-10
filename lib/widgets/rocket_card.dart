import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/rocket.dart';

class RocketCard extends StatelessWidget {
  const RocketCard({
    Key key,
    @required this.rocket,
  }) : super(key: key);

  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      elevation: 1.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: rocket.flickrImages[0],
          ),
          Container(
            height: 75,
            color: Colors.teal,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  rocket.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}