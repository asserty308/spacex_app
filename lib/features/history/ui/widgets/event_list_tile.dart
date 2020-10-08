import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/data/services/navigation.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';

class EventListTile extends StatelessWidget {
  const EventListTile({Key key, this.event}) : super(key: key);

  final History event;

  @override
  Widget build(BuildContext context) => Card(
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
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            event.details,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: getCardButtons(context),
        )
      ]
    )
  );

  /// Builds a list of buttons from the available data.
  /// Buttons can show the article, the wikipedia page or the launch details.
  List<Widget> getCardButtons(BuildContext context) {
    final list = <Widget>[];

    if (event.articleUrl != null) {
      list.add(FlatButton(
        child: Text('Article', style: TextStyle(color: Colors.white70),),
        onPressed: () => showArticle(context),
      ));
    }

    if (event.wikiUrl != null) {
      list.add(FlatButton(
        child: Text('Wikipedia', style: TextStyle(color: Colors.white70),),
        onPressed: () => showWikipedia(context),
      ));
    }

    if (event.flightNumber != null) {
      list.add(FlatButton(
        child: Text('Launch', style: TextStyle(color: Colors.white70),),
        onPressed: () => showLaunch(context),
      ));
    }

    return list;
  }

  Future<void> showArticle(BuildContext context) async => showWebView(context, event.articleUrl, event.title);
  
  Future<void> showWikipedia(BuildContext context) async => showWebView(context, event.wikiUrl, event.title);

  Future<void> showLaunch(BuildContext context) async {
    final launch = await GetIt.I<LaunchRepository>().getLaunchWithId(event.flightNumber);
    BlocProvider.of<LaunchesNavigationCubit>(context).showLaunchDetails(context, launch);
  }
}
