import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/rocket.dart';
import 'package:spacex_guide/api/spacex_api.dart';
import 'package:spacex_guide/widgets/drawer.dart';

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
            return Card(
              color: Colors.blueAccent,
              elevation: 5.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: _rockets[i].flickrImages[0],
                  ),
                  Container(
                    height: 75,
                    color: Colors.black38,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text(
                          _rockets[i].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              )
            );
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