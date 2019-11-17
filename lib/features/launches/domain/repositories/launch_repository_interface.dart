import 'package:spacex_guide/features/launches/domain/entities/launch.dart';

abstract class LaunchRepositoryInterface {
  Future<List<Launch>> getAllLaunches(); 
}