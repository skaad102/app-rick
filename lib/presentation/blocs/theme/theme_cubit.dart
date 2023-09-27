import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../config/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(appTheme: AppTheme()));

  void changeTheme() {
    final isDark = state.appTheme.isDark;
    final newTheme = state.appTheme.copyWith(isDark: !isDark);
    emit(ThemeState(appTheme: newTheme));
  }
}
