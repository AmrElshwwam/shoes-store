part of 'app_language_cubit.dart';

@immutable
sealed class AppLanguageState {}

final class AppLanguageInitial extends AppLanguageState {}

final class ChangeLocalState extends AppLanguageState {
  final Locale locale;
  ChangeLocalState({required this.locale});
}
