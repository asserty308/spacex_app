import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:spacex_guide/app/ui/widgets/image_title_card.dart';
import 'package:spacex_guide/launchpads/data/models/launchpad.dart';

class LaunchpadCard extends StatelessWidget {
  const LaunchpadCard({
    super.key,
    required this.launchpad,
  });

  final LaunchpadModel launchpad;

  @override
  Widget build(BuildContext context) {
    final coordinates = LatLng(launchpad.latitude as double, launchpad.longitude as double);

    return ImageTitleCard(
      title: launchpad.name,
      onTap: () {},
      child: FlutterMap(
        options: MapOptions(
          zoom: 12,
          center: coordinates,
          interactiveFlags: InteractiveFlag.none,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: coordinates, 
                builder: (context) => const Icon(Icons.location_on, color: Colors.red, size: 20,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}