import 'package:flutter/material.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class EventListTile extends StatelessWidget {
  const EventListTile({Key key, this.event}) : super(key: key);

  final History event;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.blueGrey,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              event.formattedDate('dd.MM.yyyy'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
              ),
            ),
          ),
          Text(
            event.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              event.details,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: getCardButtons(),
          )
        ]
      )
    );
  }

  /// Builds a list of buttons from the available data.
  /// Buttons can show the article, the wikipedia page or the launch details.
  List<Widget> getCardButtons() {
    final list = <Widget>[];

    if (event.articleUrl != null) {
      list.add(FlatButton(
        child: Text('Article', style: TextStyle(color: Colors.white70),),
        onPressed: () {},
      ));
    }

    if (event.wikiUrl != null) {
      list.add(FlatButton(
        child: Text('Wikipedia', style: TextStyle(color: Colors.white70),),
        onPressed: () {},
      ));
    }

    if (event.flightNumber != null) {
      list.add(FlatButton(
        child: Text('Launch', style: TextStyle(color: Colors.white70),),
        onPressed: () {},
      ));
    }

    return list;
  }
}