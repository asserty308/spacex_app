import 'package:flutter/material.dart';
import 'package:spacex_guide/api/models/launch.dart';
import 'package:spacex_guide/bloc/all_launches_bloc.dart';
import 'package:spacex_guide/screens/delegtes/launch_search_delegate.dart';
import 'package:spacex_guide/widgets/drawer.dart';
import 'package:spacex_guide/widgets/launch_list.dart';

class AllLaunchesScreen extends StatefulWidget {
  @override
  _AllLaunchesScreenState createState() => _AllLaunchesScreenState();
}

class _AllLaunchesScreenState extends State<AllLaunchesScreen> {
  final _bloc = AllLaunchesBloc();
  var _launchData = List<Launch>();

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showLaunchSearch(context),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: buildList(),
    );
  }

  Widget buildList() {
    return StreamBuilder(
      stream: _bloc.allLaunches,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _launchData = snapshot.data;
          return LaunchList(
            launches: _launchData,
            showNextLaunch: true,
          );
        }

        return Center(child: CircularProgressIndicator(),);
      },
    );
  }

  void showLaunchSearch(BuildContext context) {
    showSearch<Launch>(
      context: context,
      delegate: LaunchSearchDelegate(
        launchData: _launchData,
      ),
    );
  }
}