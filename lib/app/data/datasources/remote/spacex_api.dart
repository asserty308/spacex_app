import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class SpaceXApi {
  final _baseApi = 'https://api.spacexdata.com/v4/';

  Future<dynamic> request(String path) async {
    final response = await http.get(Uri.parse('$_baseApi$path'));
    final json = jsonDecode(response.body);
    return json;
  }
}