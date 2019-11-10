import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/bloc/launch_bloc.dart';
import 'package:spacex_guide/screens/launch_screen.dart';
import 'package:spacex_guide/utility/navigation.dart';
import 'package:spacex_guide/widgets/drawer.dart';

class AllLaunchesScreen extends StatefulWidget {
  @override
  _AllLaunchesScreenState createState() => _AllLaunchesScreenState();
}

class _AllLaunchesScreenState extends State<AllLaunchesScreen> {
  final _bloc = LaunchBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchAllLaunches();
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
        title: Text('All Launches'),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black87,
        child: StreamBuilder(
          stream: _bloc.allLaunches,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            }

            return Center(child: CircularProgressIndicator(),);
          },
        )
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Launch>> snapshot) {
    var launches = snapshot.data;

    return ListView.builder(
      itemCount: launches.length,
      itemBuilder: (context, i) {
        final launch = launches[i];

        return ListTile(
          title: Text(
            launch.missionName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            launch.formattedLaunchDate(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: CircleAvatar(
            child: launch.missionPatch == null ? Text(
              '${launch.flightNumber}',
              style: TextStyle(color: Colors.white),
            ) : CachedNetworkImage(
              imageUrl: launch.missionPatch,
            ),
            backgroundColor: launch.missionPatch == null ? Colors.white24 : Colors.transparent,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white30,
            size: 18,
          ),
          onTap: () => showScreen(context, LaunchScreen(launch)),
        );
      },
    );
  }
}