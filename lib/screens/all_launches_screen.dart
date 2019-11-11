import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/bloc/all_launches_bloc.dart';
import 'package:spacex_guide/screens/launch_detail_screen.dart';
import 'package:spacex_guide/utility/navigation.dart';
import 'package:spacex_guide/widgets/drawer.dart';
import 'package:spacex_guide/widgets/launch_countdown.dart';

class AllLaunchesScreen extends StatefulWidget {
  @override
  _AllLaunchesScreenState createState() => _AllLaunchesScreenState();
}

class _AllLaunchesScreenState extends State<AllLaunchesScreen> {
  final _bloc = AllLaunchesBloc();

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
    final launches = snapshot.data;
    final nextLaunch = getNextLaunch(launches);

    return ListView.builder(
      itemCount: launches.length + 1, // +1 for next launch card
      itemBuilder: (context, i) {
        if (i == 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 1.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.indigo,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${nextLaunch.missionName} will launch in', 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 18, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 8,),
                      LaunchCountdown(
                        launch: nextLaunch,
                        textSize: 22,
                      ),
                    ],
                  ),
                ),
                onTap: () => showScreen(context, LaunchDetailScreen(nextLaunch)),
              ),
            ),
          );
        }

        final launch = launches[i - 1];

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
          onTap: () => showScreen(context, LaunchDetailScreen(launch)),
        );
      },
    );
  }

  /// Filters [_launches] by upcoming and sorts by date to return the upcoming launch.
  Launch getNextLaunch(List<Launch> launches) {
    List<Launch> upcoming = launches.where((l) => l.isUpcoming()).toList();
    upcoming.sort((l1, l2) => l1.launchDateUnix.compareTo(l2.launchDateUnix));
    return upcoming.isEmpty ? null : upcoming[0];
  }
}