import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/launches/data/models/launch.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';

part 'rocket_details_state.dart';

class RocketDetailsCubit extends Cubit<RocketDetailsState> {
  RocketDetailsCubit({
    @required this.launchRepository,
  }) : super(RocketDetailsInitial());

  final LaunchRepository launchRepository;

  Future<void> loadDetails() async {
    emit(RocketDetailsLoading());
    final launches = await launchRepository.getAllLaunches();
    emit(RocketDetailsLoaded(launches));
  }
}
