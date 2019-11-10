import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/rocket.dart';
import 'package:spacex_guide/api/spacex_api.dart';
import 'package:spacex_guide/widgets/drawer.dart';
import 'package:spacex_guide/widgets/rocket_card.dart';

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
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black87,
        child: _rockets.isEmpty ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: _rockets.length,
          itemBuilder: (context, i) {
            final rocket = _rockets[i];
            return RocketCard(rocket: rocket);
          },
        ),
      )
    );
  }

  void fetchRockets() async {
    final api = SpaceXAPI();
    _rockets = await api.getAllRockets();

    setState(() {
    });
  }
}