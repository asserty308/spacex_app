import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/launchpads/data/models/launchpad.dart';
import 'package:spacex_guide/features/launchpads/data/repositories/launchpad_repository.dart';

part 'launchpad_list_state.dart';

class LaunchpadListCubit extends Cubit<LaunchpadListState> {
  LaunchpadListCubit({
    @required this.launchpadRepository,
  }) : super(LaunchpadListInitial());

  final LaunchpadRepository launchpadRepository;

  Future<void> loadData() async {
    emit(LaunchpadListLoading());

    try {
      final launchpads = await launchpadRepository.getAllLaunchpads();
      emit(LaunchpadListLoaded(launchpads));

      if (launchpads == null || launchpads.isEmpty) {
        emit(LaunchpadListError());
        return;
      }

      emit(LaunchpadListLoaded(launchpads));
    } catch (e) {
      print('LaunchpadListCubit::loadData ERROR: $e');
      emit(LaunchpadListError());
    }
  }
}
