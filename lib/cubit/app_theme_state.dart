part of 'app_theme_cubit.dart';

// @immutable
sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}

final class LoadedThemeState extends AppThemeState {
  final ThemeData theme;

  LoadedThemeState({required this.theme});
}
