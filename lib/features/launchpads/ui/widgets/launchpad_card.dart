import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:spacex_guide/core/ui/widgets/image_title_card.dart';
import 'package:spacex_guide/core/utility/navigation.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/rockets/ui/screens/rocket_details.dart';
import 'package:latlong/latlong.dart';

class LaunchpadCard extends StatelessWidget {
  const LaunchpadCard({
    Key key,
    @required this.launchpad,
  }) : super(key: key);

  final Launchpad launchpad;

  @override
  Widget build(BuildContext context) {
    final coordinates = LatLng(launchpad.latitude, launchpad.longitude);

    return ImageTitleCard(
      mainWidget: FlutterMap(
        options: MapOptions(
          center: coordinates,
          zoom: 6,
          interactive: false,
        ),
        layers: <LayerOptions>[
          TileLayerOptions(
            urlTemplate: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c', 'd'],
            backgroundColor: Theme.of(context).primaryColor,
          ),
          MarkerLayerOptions(markers: <Marker>[
            Marker(
              width: 40.0,
              height: 40.0,
              point: coordinates,
              builder: (context) => Icon(
                Icons.location_on,
                color: Theme.of(context).accentColor,
                size: 40.0,
              ),
            )
          ])
        ],
      ),
      title: launchpad.name,
      onTap: () {},
    );
  }
}