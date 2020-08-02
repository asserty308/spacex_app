import 'package:bloc/bloc.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';
import 'package:spacex_guide/features/rockets/data/models/rocket.dart';
import 'package:spacex_guide/features/rockets/data/repositories/rockets_repository.dart';

part 'all_data_state.dart';

// TODO: Provide as local datasource
var globalRocketData = <Rocket>[];
var globalLaunchpadData = <Launchpad>[];

class AllDataCubit extends Cubit<AllDataState> {
  AllDataCubit() : super(AllDataEmpty());

  final _rocketRepo = RocketsRepository();
  final _launchpadRepo = LaunchpadRepository();

  void getAllData() async {
    emit(AllDataLoading());

    try {
      globalRocketData = await _rocketRepo.getAllRockets();
      globalLaunchpadData = await _launchpadRepo.getAllLaunchpads();

      emit(AllDataStateLoaded());
    } catch (e) {
      print(e);
      emit(AllDataError());
    }
  }
}