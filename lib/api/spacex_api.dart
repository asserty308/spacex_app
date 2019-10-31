import 'dart:convert';
import 'package:http/http.dart' as http;

class SpaceXAPI {
  final _baseUrl = 'https://api.spacexdata.com/v3/';

  /// Wrapper to fetch JSON from the API
  Future<dynamic> getJSON(String url) async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  // Launches

  Future<dynamic> getLatestLaunch() async {
    final url = '${_baseUrl}launches/latest/';
    return await getJSON(url);
  }

  Future<dynamic> getNextLaunch() async {
    final url = '${_baseUrl}launches/next/';
    return await getJSON(url);
  }

  Future<dynamic> getAllLaunches() async {
    final url = '${_baseUrl}launches/';
    return await getJSON(url);
  }

  Future<dynamic> getPastLaunches() async {
    final url = '${_baseUrl}launches/past';
    return await getJSON(url);
  }

  Future<dynamic> getUpcomingLaunches() async {
    final url = '${_baseUrl}launches/upcoming/';
    return await getJSON(url);
  }
}