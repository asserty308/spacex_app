import 'package:spacex_guide/core/api/spacex_api.dart';
import 'package:spacex_guide/core/error/error.dart';
import 'package:spacex_guide/features/history/data/models/history.dart';

class LaunchRemoteDatasource {
  final _api = SpaceXAPI();

  /// Calls the history endpoint endpoint on the SpaceX api.
  Future<dynamic> getAllEvents() async {
    final response = await _api('history/');

    if (response is AppError) {
      return response;
    }

    final list = <History>[];
    response.forEach((event) => list.add(History.fromJSON(event)));
    return list;
  }

}