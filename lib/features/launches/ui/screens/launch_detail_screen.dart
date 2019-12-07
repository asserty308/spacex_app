import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_info.dart';

/// Handles 'All launches -> Launch details' as well as the 'Next Launch' screen.
/// The 'All launches' screen transmits the selected [launch] as a parameter.
/// The next launch will be loaded when the parameter is null.
class LaunchDetailScreen extends StatefulWidget {
  const LaunchDetailScreen([this._launch]);

  final Launch _launch;

  @override
  _LaunchDetailScreenState createState() => _LaunchDetailScreenState();
}

class _LaunchDetailScreenState extends State<LaunchDetailScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final imageUrls = widget._launch?.flickrImages ?? [];

    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  widget._launch?.missionName,
                ),
                background: ImageCarousel(
                  imageUrls: imageUrls,
                ),
              ),
            )
          ];
        },
        body: Container(
          child: LaunchInfo(
            launch: widget._launch,
          ),
        )
      ),
    );
  }
}