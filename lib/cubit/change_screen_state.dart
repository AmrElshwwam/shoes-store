part of 'change_screen_cubit.dart';

@immutable
sealed class ChangeScreenState {}

final class ChangeScreenInitial extends ChangeScreenState {}

final class UpdatedScreenState extends ChangeScreenState {
  final int currentScreen;
  UpdatedScreenState({required this.currentScreen});
}
