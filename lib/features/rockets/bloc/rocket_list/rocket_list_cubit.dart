import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rocket_list_state.dart';

class RocketListCubit extends Cubit<RocketListState> {
  RocketListCubit() : super(RocketListInitial());
}
