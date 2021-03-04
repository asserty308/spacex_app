import 'package:flutter_web/services/base_api.dart';

abstract class SpaceXApi extends BaseApi {
  SpaceXApi() : super('https://api.spacexdata.com/v4/');
}