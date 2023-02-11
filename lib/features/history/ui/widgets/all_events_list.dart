import 'package:flutter/material.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/history/ui/widgets/event_list_tile.dart';

class AllEventsList extends StatelessWidget {
  const AllEventsList({Key? key, this.events}) : super(key: key);

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