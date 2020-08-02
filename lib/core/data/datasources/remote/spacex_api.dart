import 'package:flutter_core/web/base_api.dart';

// TODO: Update to v4 API (https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/README.md)

class SpaceXApi {
  final _api = BaseApi('https://api.spacexdata.com/v3/');

  /// Wrapper to fetch JSON from the API
  Future<dynamic> fetchJSON(String path) async {
    return _api.fetchJSON(path);
  }
}