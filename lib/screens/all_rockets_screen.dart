import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/rocket.dart';
import 'package:spacex_guide/bloc/rocket_bloc.dart';
import 'package:spacex_guide/widgets/drawer.dart';
import 'package:spacex_guide/widgets/rocket_card.dart';

class AllRocketsScreen extends StatefulWidget {
  @override
  _AllRocketsScreenState createState() => _AllRocketsScreenState();
}

class _AllRocketsScreenState extends State<AllRocketsScreen> {
  final _bloc = RocketBloc();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Rockets'),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black87,
        child: StreamBuilder(
          stream: _bloc.allRockets,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            }

            return Center(child: CircularProgressIndicator(),);
          },
        )
      )
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