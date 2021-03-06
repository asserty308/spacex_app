import 'package:flutter/material.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/history/ui/widgets/event_list_tile.dart';

class AllEventsList extends StatelessWidget {
  const AllEventsList({this.events});

  final List<History>? events;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: events!.length,
        itemBuilder: (context, i) {
          final event = events![i];
          return EventListTile(event: event,);
        },
      ),
    );
  }
}