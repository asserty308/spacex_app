import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/api/spacex_api.dart';
import 'package:spacex_guide/screens/launch_screen.dart';
import 'package:spacex_guide/utility/navigation.dart';
import 'package:spacex_guide/widgets/drawer.dart';

class AllLaunchesScreen extends StatefulWidget {
  @override
  _AllLaunchesScreenState createState() => _AllLaunchesScreenState();
}

class _AllLaunchesScreenState extends State<AllLaunchesScreen> {
  List<Launch> _launches = List();

  @override
  void initState() {
    super.initState();
    fetchLaunches();
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
        child: _launches.isEmpty ? Center(child: CircularProgressIndicator(),) : ListView.builder(
          itemCount: _launches.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(
                _launches[i].missionName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                _launches[i].formattedLaunchDate(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                child: _launches[i].missionPatch == null ? Text(
                  '${_launches[i].flightNumber}',
                  style: TextStyle(color: Colors.white),
                ) : CachedNetworkImage(
                  imageUrl: _launches[i].missionPatch,
                ),
                backgroundColor: _launches[i].missionPatch == null ? Colors.white24 : Colors.transparent,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white30,
                size: 18,
              ),
              onTap: () {
                showScreen(context, LaunchScreen(_launches[i]));
              },
            );
          },
        ),
      ),
    );
  }

  void fetchLaunches() async {
    final api = SpaceXAPI();
    _launches = await api.getAllLaunches();

    setState(() {
    });
  }
}