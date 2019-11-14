import 'package:flutter/material.dart';
import 'package:spacex_guide/widgets/drawer.dart';
import 'package:spacex_guide/widgets/rocket_list.dart';

class AllRocketsScreen extends StatefulWidget {
  @override
  _AllRocketsScreenState createState() => _AllRocketsScreenState();
}

class _AllRocketsScreenState extends State<AllRocketsScreen> {
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
        child: RocketList()
      )
    );
  }
}