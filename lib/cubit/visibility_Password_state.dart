part of 'visibility_password_cubit.dart';

// @immutable
sealed class VisibilityPasswordState {}

final class VisibilityPasswordInitial extends VisibilityPasswordState {}

final class UpdatedVisibilityPasswordState extends VisibilityPasswordState {
  final bool visibilityOn;

  UpdatedVisibilityPasswordState({required this.visibilityOn});
}
