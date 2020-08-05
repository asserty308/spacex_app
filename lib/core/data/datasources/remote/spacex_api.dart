import 'package:flutter_core/web/base_api.dart';

// TODO: Update to v4 API (https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/README.md)

class SpaceXApi extends BaseApi {
  SpaceXApi() : super('https://api.spacexdata.com/v4/');
}