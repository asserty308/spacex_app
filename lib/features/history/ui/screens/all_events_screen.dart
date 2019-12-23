import 'package:flutter/material.dart';
import 'package:spacex_guide/core/bloc/all_data/all_data_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';
import 'package:spacex_guide/core/ui/widgets/error_message.dart';
import 'package:spacex_guide/features/history/ui/widgets/all_events_list.dart';

class AllEventsScreen extends StatefulWidget {
  @override
  _AllEventsScreenState createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
      ),
      drawer: MyDrawer(),
      body: buildList(),
    );
  }

  Widget buildList() {
    return globalHistoryData.isNotEmpty ? AllEventsList(events: globalHistoryData,) : const ErrorMessage(
      message: 'Unable to load history. Please try again later',
    );
  }
}