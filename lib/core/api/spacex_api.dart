import 'package:flutter_core/web/base_api.dart';

class SpaceXApi {
  final _api = BaseAPI('https://api.spacexdata.com/v3/');

  /// Wrapper to fetch JSON from the API
  Future<dynamic> fetchJSON(String path) async {
    return _api.fetchJSON(path);
  }
}