import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/ui/widgets/rocket_card.dart';

class RocketList extends StatefulWidget {
  const RocketList({
    Key key,
  }) : super(key: key);

  @override
  _RocketListState createState() => _RocketListState();
}

class _RocketListState extends State<RocketList> {
  
  @override
  Widget build(BuildContext context) {
    return golbalRocketData.isNotEmpty ? buildList(golbalRocketData) : const Center(
      child: Text(
        'Something went wrong. Please try again later',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildList(List<Rocket> rockets) {
    return ListView.builder(
      itemCount: rockets.length,
      itemBuilder: (context, i) {
        final rocket = rockets[i];
        return RocketCard(rocket: rocket);
      }
    );
  }
}