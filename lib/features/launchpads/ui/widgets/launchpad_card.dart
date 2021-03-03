import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spacex_guide/core/ui/widgets/image_title_card.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';

class LaunchpadCard extends StatelessWidget {
  const LaunchpadCard({
    Key? key,
    required this.launchpad,
  }) : super(key: key);

  final LaunchpadModel launchpad;

  @override
  Widget build(BuildContext context) {
    final coordinates = LatLng(launchpad.latitude as double, launchpad.longitude as double);

    return ImageTitleCard(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: coordinates,
          zoom: 12,
        ),
        markers: <Marker>{
          Marker(
            markerId: MarkerId('Marker'),
            position: coordinates,
          )
        },
      ),
      title: launchpad.name,
      onTap: () {},
    );
  }
}