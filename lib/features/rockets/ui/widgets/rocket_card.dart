import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/image_title_card.dart';
import 'package:spacex_guide/core/utility/navigation.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/screens/rocket_details.dart';

class RocketCard extends StatelessWidget {
  const RocketCard({
    Key key,
    @required this.rocket,
  }) : super(key: key);

  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return ImageTitleCard(
      mainWidget: Hero(
        tag: '${rocket.id}Hero',
        child: CachedNetworkImage(
          width: double.infinity,
          imageUrl: rocket.flickrImages[0],
          fit: BoxFit.cover,
        ),
      ),
      title: rocket.name,
      onTap: () => showScreen(context, RocketDetailsScreen(rocket: rocket)),
    );
  }
}