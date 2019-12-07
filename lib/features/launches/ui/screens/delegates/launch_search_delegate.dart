import 'package:flutter/material.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/ui/widgets/launch_list.dart';

class LaunchSearchDelegate extends SearchDelegate<Launch> {
  LaunchSearchDelegate({this.launchData});

  final List<Launch> launchData;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.dark,
      textTheme: theme.textTheme.copyWith(
        title: TextStyle(fontWeight: FontWeight.normal),
        
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
  Widget buildResults(BuildContext context) {
    return showSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return showSearchResults();
  }

  Widget showSearchResults() {
    if (launchData == null || launchData.isEmpty) {
      return Center(child: const CircularProgressIndicator(),);
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