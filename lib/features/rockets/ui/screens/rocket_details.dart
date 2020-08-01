import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/screens/all_rockets_screen.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_carousel.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_info.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({
    this.rocket,
    this.allRocketsScreen,
  });

  final Rocket rocket;
  final AllRocketsScreen allRocketsScreen;

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: () async {
      shouldReloadRocketCarousel = true;
      return true;
    },
    child: _scaffold,
  );

  // Widgets

  Widget get _scaffold => Scaffold(
    body: _scrollView,
  );

  Widget get _scrollView => NestedScrollView(
    headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
      _sliverAppBar,
    ],
    body: _body,
  );

  Widget get _sliverAppBar => SliverAppBar(
    expandedHeight: 200.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: ImageCarousel(
        imageUrls: rocket.flickrImages,
      ),
    ),
  );

  Widget get _body => Container(
    child: RocketInfo(rocket: rocket,),
  );
}