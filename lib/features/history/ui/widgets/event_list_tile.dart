import 'package:flutter/material.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class EventListTile extends StatelessWidget {
  const EventListTile({Key key, this.event}) : super(key: key);

  final History event;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        event.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        event.formattedDate(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}