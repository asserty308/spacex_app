import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/progress_indicator.dart';
import 'package:spacex_guide/features/rockets/bloc/all_rockets_bloc.dart';
import 'package:spacex_guide/features/rockets/bloc/all_rockets_events.dart';
import 'package:spacex_guide/features/rockets/bloc/all_rockets_states.dart';
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
  final _bloc = AllRocketsBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetAllRockets());
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is AllRocketsEmpty || state is AllRocketsLoading) {
          return MyProgressIndicator();
        }

        if (state is AllRocketsLoaded) {
          return buildList(state.rockets);
        }

        if (state is AllRocketsError) {
          return Center(
            child: const Text(
              'Something went wrong. Please try again later',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        // no state
        return Container();
      }
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