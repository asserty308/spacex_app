import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/launches/data/models/launch.dart';
import 'package:spacex_guide/launches/data/repositories/launch_repository.dart';

part 'rocket_details_state.dart';

class RocketDetailsCubit extends Cubit<RocketDetailsState> {
  RocketDetailsCubit() : super(RocketDetailsInitial());

  final LaunchRepository? launchRepository = GetIt.I<LaunchRepository>();

  Future<void> loadDetails() async {
    emit(RocketDetailsLoading());
    final launches = await launchRepository!.getAllLaunches();
    emit(RocketDetailsLoaded(launches));
  }
}
