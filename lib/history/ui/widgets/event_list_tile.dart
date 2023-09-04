import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/app/data/services/navigation.dart';
import 'package:spacex_guide/history/data/models/history.dart';
import 'package:spacex_guide/launches/bloc/navigation/launches_navigation_bloc.dart';
import 'package:spacex_guide/launches/data/repositories/launch_repository.dart';

class EventListTile extends StatefulWidget {
  const EventListTile({super.key, this.event});

  final History? event;

  @override
  State<EventListTile> createState() => _EventListTileState();
}

class _EventListTileState extends State<EventListTile> {
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
            widget.event!.formattedDate('dd.MM.yyyy'),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16.0,
            ),
          ),
        ),
        Text(
          widget.event!.title!,
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
            widget.event!.details!,
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

    if (widget.event!.articleUrl != null) {
      list.add(TextButton(
        onPressed: () => showArticle(context),
        child: const Text('Article', style: TextStyle(color: Colors.white70),),
      ));
    }

    if (widget.event!.wikiUrl != null) {
      list.add(TextButton(
        onPressed: () => showWikipedia(context),
        child: const Text('Wikipedia', style: TextStyle(color: Colors.white70),),
      ));
    }

    if (widget.event!.flightNumber != null) {
      list.add(TextButton(
        onPressed: () => showLaunch(context),
        child: const Text('Launch', style: TextStyle(color: Colors.white70),),
      ));
    }

    return list;
  }

  Future<void> showArticle(BuildContext context) async => showWebView(context, widget.event!.articleUrl!, widget.event!.title!);

  Future<void> showWikipedia(BuildContext context) async => showWebView(context, widget.event!.wikiUrl!, widget.event!.title!);

  Future<void> showLaunch(BuildContext context) async {
    final launch = await GetIt.I<LaunchRepository>().getLaunchWithId(widget.event!.flightNumber);

    if (mounted) {
      GetIt.I<LaunchesNavigationCubit>().showLaunchDetails(context, launch);
    }
  }
}
