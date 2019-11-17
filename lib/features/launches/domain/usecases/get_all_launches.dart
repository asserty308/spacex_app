import 'package:spacex_guide/core/usecases/usecase.dart';
import 'package:spacex_guide/features/launches/domain/entities/launch.dart';
import 'package:spacex_guide/features/launches/domain/repositories/launch_repository_interface.dart';

class GetAllLaunches implements UseCase<List<Launch>> {
  GetAllLaunches(this.repository);

  final LaunchRepositoryInterface repository;

  @override
  Future<List<Launch>> call() async {
    return await repository.getAllLaunches();
  }
}