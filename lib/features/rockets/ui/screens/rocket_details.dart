import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/screens/all_rockets_screen.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_carousel.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_info.dart';

class RocketDetailsScreen extends StatefulWidget {
  const RocketDetailsScreen({
    this.rocket,
    this.allRocketsScreen,
  });

  final Rocket rocket;
  final AllRocketsScreen allRocketsScreen;
  
  @override
  _RocketDetailsScreenState createState() => _RocketDetailsScreenState();
}

class _RocketDetailsScreenState extends State<RocketDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        shouldReloadRocketCarousel = true;
        return true;
      },
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: ImageCarousel(
                    imageUrls: widget.rocket.flickrImages,
                  ),
                ),
              )
            ];
          },
          body: Container(
            child: RocketInfo(rocket: widget.rocket,),
          )
        ),
      ),
    );
  }
}