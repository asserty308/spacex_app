import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/core/ui/widgets/progress_indicator.dart';
import 'package:spacex_guide/features/history/bloc/all_events_bloc.dart';
import 'package:spacex_guide/features/history/bloc/all_events_events.dart';
import 'package:spacex_guide/features/history/bloc/all_events_states.dart';
import 'package:spacex_guide/features/history/ui/widgets/all_events_list.dart';

class AllEventsScreen extends StatefulWidget {
  @override
  _AllEventsScreenState createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {
  final _bloc = AllEventsBloc();

  @override
  void initState() {
    super.initState();
    
    // immediately load events
    _bloc.add(GetAllEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
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
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is AllEventsEmpty || state is AllEventsLoading) {
          return MyProgressIndicator();
        }

        if (state is AllEventsLoaded) {
          return AllEventsList(events: state.events,);
        }

        if (state is AllEventsError) {
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

        return Container();
      },
    );
  }
}