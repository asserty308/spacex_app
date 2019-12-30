import 'package:flutter/material.dart';
import 'package:flutter_core/ui/widgets/center_progress_indicator.dart';
import 'package:spacex_guide/core/ui/themes/default_theme.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/list/launch_list.dart';

class LaunchSearchDelegate extends SearchDelegate<Launch> {
  LaunchSearchDelegate({this.launchData});

  final List<Launch> launchData;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return defaultTheme.copyWith(
      primaryColor: const Color.fromARGB(255, 1, 1, 1),
      primaryIconTheme: defaultTheme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.dark,
      textTheme: defaultTheme.textTheme.copyWith(
        title: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
      ),
      inputDecorationTheme: defaultTheme.inputDecorationTheme.copyWith(
        hintStyle: TextStyle(color: Colors.white60, fontWeight: FontWeight.normal),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // add a 'clear query' button
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // show a back button to close the search
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => showSearchResults();

  @override
  Widget buildSuggestions(BuildContext context) => showSearchResults();

  Widget showSearchResults() {
    if (launchData == null || launchData.isEmpty) {
      return CenterProgressIndicator();
    }

    final lowerQuery = query.toLowerCase();
    final launches = launchData.where((l) => 
      l.missionName?.toLowerCase()?.contains(lowerQuery) == true ||
      l.details?.toLowerCase()?.contains(lowerQuery) == true ||
      l.rocket?.name?.toLowerCase()?.contains(lowerQuery) == true
    ).toList();

    return LaunchList(
      launches: launches,
      showNextLaunch: false,
    );
  }
}