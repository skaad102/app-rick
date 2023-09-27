part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({required this.appTheme});

  @override
  List<Object> get props => [appTheme];
}
