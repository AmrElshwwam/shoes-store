part of 'profile_data_cubit.dart';

// @immutable
sealed class ProfileDataState {}

final class ProfileDataInitial extends ProfileDataState {}

final class UpdateProfileDataState extends ProfileDataState {
  final String fullName;
  // final String lastName;
  final String email;
  final String phone;
  final String password;

  UpdateProfileDataState({
    required this.fullName,
    // required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
  });
}

final class OpenFieldState extends ProfileDataState {
  final bool openField;

  OpenFieldState({required this.openField});
}
