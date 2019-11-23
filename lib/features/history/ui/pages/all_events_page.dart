import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/history/ui/bloc/all_events_bloc.dart';
import 'package:spacex_guide/features/history/ui/widgets/all_events_list.dart';

class AllEventsScreen extends StatefulWidget {
  @override
  _AllEventsScreenState createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {
  final _bloc = AllEventsBloc();

  var _eventsData = List<History>();

  @override
  void initState() {
    super.initState();
    
    // immediately load events
    _bloc.add(AllEventsEvent.getAllEvents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
        backgroundColor: Colors.black,
      ),
      drawer: const MyDrawer(),
      body: buildList(),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Widget buildList() {
    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _eventsData = snapshot.data;
          return AllEventsList(
            events: _eventsData,
          );
        }

        return Center(child: const CircularProgressIndicator(),);
      },
    );
  }
}