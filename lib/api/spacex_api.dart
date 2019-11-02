import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex_guide/api/models/launch.dart';

class SpaceXAPI {
  final _baseUrl = 'https://api.spacexdata.com/v3/';

  /// Wrapper to fetch JSON from the API
  Future<dynamic> _fetchJSON(String url) async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  // Launches

  Future<Launch> _fetchLaunchFromUrl(String url) async {
    final json = await _fetchJSON(url);
    return Launch.fromJSON(json);
  }

  Future<Launch> getLatestLaunch() async {
    final url = '${_baseUrl}launches/latest/';
    return await _fetchLaunchFromUrl(url);
  }

  Future<Launch> getNextLaunch() async {
    final url = '${_baseUrl}launches/next/';
    return await _fetchLaunchFromUrl(url);
  }

  Future<List<Launch>> getAllLaunches() async {
    final url = '${_baseUrl}launches/';
    final response = await _fetchJSON(url);
    List<Launch> list = List();

    for (var launch in response) {
      list.add(Launch.fromJSON(launch));
    }

    return list;
  }

  Future<Launch> getPastLaunches() async {
    final url = '${_baseUrl}launches/past';
    return await _fetchLaunchFromUrl(url);
  }

  Future<Launch> getUpcomingLaunches() async {
    final url = '${_baseUrl}launches/upcoming/';
    return await _fetchLaunchFromUrl(url);
  }
}