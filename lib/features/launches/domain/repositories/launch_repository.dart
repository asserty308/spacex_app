import 'package:spacex_guide/features/launches/domain/entities/launch.dart';

abstract class LaunchRepository {
  Future<List<Launch>> getAllLaunches(); 
}