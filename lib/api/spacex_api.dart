import 'dart:convert';
import 'package:http/http.dart' as http;

class SpaceXAPI {
  final _baseUrl = 'https://api.spacexdata.com/v3/';

  /// Wrapper to fetch JSON from the API
  Future<dynamic> getJSON(String url) async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<dynamic> getNextLaunch() async {
    final url = '${_baseUrl}launches/next/';
    final response = await getJSON(url);
    return response;
  } 
}