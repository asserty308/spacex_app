import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'about_screen_state.dart';

class AboutScreenCubit extends Cubit<AboutScreenState> {
  AboutScreenCubit() : super(AboutScreenInitial());
}
