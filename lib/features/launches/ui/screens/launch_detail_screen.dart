import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/image_carousel.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_info.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

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

  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();

    // run 'afterFirstlayout' after first build()
    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstlayout(context));
  }

  @override
  Widget build(BuildContext context) {
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
                  imageUrls: _imageUrls,
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

  void afterFirstlayout(BuildContext context) {
    // show search when showing screen
    loadImages();
  }

  Future<void> loadImages() async {
    _imageUrls = widget._launch?.flickrImages ?? [];

    if (_imageUrls.isEmpty) {
      final response = await RocketsRepository().getRocket(widget._launch.rocket.id);
      
      if (response is Rocket) {
        _imageUrls = response.flickrImages;
      }
    }

    setState(() {
    });
  }
}