import 'dart:convert';
import 'package:http/http.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class SpaceXApi {
  final _baseUrl = 'https://api.spacexdata.com/v3/';

  /// Wrapper to fetch JSON from the API
  Future<dynamic> fetchJSON(String endpoint) async {
    final url = '$_baseUrl$endpoint';
    final response = await get(url);
    final statusCode = response.statusCode;

    if (statusCode != 200) {
      throw Exception('Received error $statusCode on url $url');
    }

    return json.decode(response.body);
  }
}