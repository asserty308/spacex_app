import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/rocket.dart';
import 'package:spacex_guide/bloc/all_rockets_bloc.dart';
import 'package:spacex_guide/widgets/rocket_card.dart';

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
    _bloc.fetchAllRockets();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.allRockets,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot);
        }

        return Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Widget buildList(AsyncSnapshot<List<Rocket>> snapshot) {
    var rockets = snapshot.data;

    return ListView.builder(
      itemCount: rockets.length,
      itemBuilder: (context, i) {
        final rocket = rockets[i];
        return RocketCard(rocket: rocket);
      }
    );
  }
}