import 'package:flutter/material.dart';
import 'package:spacex_guide/history/data/models/history.dart';
import 'package:spacex_guide/history/ui/widgets/event_list_tile.dart';

class AllEventsList extends StatelessWidget {
  const AllEventsList({super.key, this.events});

  final List<History>? events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events!.length,
      itemBuilder: (context, i) {
        final event = events![i];
        return EventListTile(event: event,);
      },
    );
  }
}