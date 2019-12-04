import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/text_card.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class RocketInfo extends StatelessWidget {
  const RocketInfo({
    Key key,
    this.rocket,
  }) : super(key: key);

  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TextCard(text: rocket.description,)
      ],
    );
  }
}