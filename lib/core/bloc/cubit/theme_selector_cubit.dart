import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_selector_state.dart';

class ThemeSelectorCubit extends Cubit<ThemeSelectorState> {
  ThemeSelectorCubit() : super(ThemeSelectorDark());

  void setDarkTheme() => emit(ThemeSelectorDark());
  void setLightTheme() => emit(ThemeSelectorLight());
}
