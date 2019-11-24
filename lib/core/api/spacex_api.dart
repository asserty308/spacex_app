import 'dart:convert';
import 'package:http/http.dart';
import 'package:spacex_guide/core/error/error.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';

class SpaceXAPI {
  final _baseUrl = 'https://api.spacexdata.com/v3/';

  /// Public accessor for [_fetchJSON].
  /// The [_baseUrl] should not be part of the [endpoint] parameter.
  Future<dynamic> call(String endpoint) async {
    return _fetchJSON('$_baseUrl$endpoint');
  }

  /// Wrapper to fetch JSON from the API
  Future<dynamic> _fetchJSON(String url) async {
    final response = await get(url);
    final statusCode = response.statusCode;

    if (statusCode != 200) {
      return AppErrorApi(code: '$statusCode', message: 'Error received on url $url');
    }

    return json.decode(response.body);
  }

  // Rockets

  Future<List<Rocket>> getAllRockets() async {
    final url = '${_baseUrl}rockets/';
    final response = await _fetchJSON(url);
    final list = <Rocket>[];

    for (final rocket in response) {
      list.add(Rocket.fromJSON(rocket));
    }

    return list;
  }

  // History

  Future<List<History>> getHistory() async {
    final url = '${_baseUrl}history/';
    final response = await _fetchJSON(url);
    final list = <History>[];

    for (final event in response) {
      list.add(History.fromJSON(event));
    }

    return list;
  }
}