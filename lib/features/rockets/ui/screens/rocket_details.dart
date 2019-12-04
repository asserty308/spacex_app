import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_info.dart';

class RocketDetailsScreen extends StatefulWidget {
  const RocketDetailsScreen({
    this.rocket,
  });

  final Rocket rocket;
  
  @override
  _RocketDetailsScreenState createState() => _RocketDetailsScreenState();
}

class _RocketDetailsScreenState extends State<RocketDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(widget.rocket.name),
                background: ImageCarousel(
                  imageUrls: widget.rocket.flickrImages,
                ),
              ),
            )
          ];
        },
        body: Container(
          color: Colors.black87,
          child: RocketInfo(rocket: widget.rocket,),
        )
      ),
    );
  }
}