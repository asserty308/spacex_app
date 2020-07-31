import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_carousel.dart';

class AllRocketsScreen extends StatefulWidget {
  @override
  _AllRocketsScreenState createState() => _AllRocketsScreenState();
}

class _AllRocketsScreenState extends State<AllRocketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX Rockets'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: RocketCarousel()
      )
    );
  }
}