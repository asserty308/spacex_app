import 'package:flutter/material.dart';
import 'package:spacex_guide/app/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/rockets/ui/widgets/rocket_carousel.dart';

class AllRocketsScreen extends StatefulWidget {
  const AllRocketsScreen({super.key});

  @override
  State<AllRocketsScreen> createState() => _AllRocketsScreenState();
}

class _AllRocketsScreenState extends State<AllRocketsScreen> {
  @override
  Widget build(BuildContext context) => AppScaffold(
    title: const Text('SpaceX Rockets'),
    body: RocketCarousel()
  );
}