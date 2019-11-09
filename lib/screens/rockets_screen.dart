import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/rocket.dart';
import 'package:spacex_guide/api/spacex_api.dart';

class RocketsScreen extends StatefulWidget {
  @override
  _RocketsScreenState createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  var _rockets = List<Rocket>();

  @override
  void initState() {
    super.initState();
    fetchRockets();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Rockets'),
        backgroundColor: Colors.black,
      ),
      body: _rockets.isEmpty ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: _rockets.length,
        itemBuilder: (context, i) {
          return Card(
            color: Colors.blueAccent,
            elevation: 5.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: CachedNetworkImage(
              imageUrl: _rockets[i].flickrImages[0],
            )
          );
        },
      ),
    );
  }

  void fetchRockets() async {
    final api = SpaceXAPI();
    _rockets = await api.getAllRockets();

    setState(() {
    });
  }
}