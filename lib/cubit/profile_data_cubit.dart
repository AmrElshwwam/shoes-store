import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  // bool openField = false;
  String fullName = "";
  String email = "";
  String phone = "";
  String password = "";

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  ProfileDataCubit() : super(ProfileDataInitial()) {
    _initializeControllers();
    _loadProfileData();
  }

  void _initializeControllers() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> _loadProfileData() async {
    final pref = await SharedPreferences.getInstance();
    fullName = pref.getString("fullName") ?? "";
    email = pref.getString("email") ?? "";
    phone = pref.getString("phone") ?? "";
    password = pref.getString("password") ?? "";

    // تعيين القيم إلى الـ Controllers
    fullNameController.text = fullName;
    emailController.text = email;
    phoneController.text = phone;
    passwordController.text = password;

    emit(UpdateProfileDataState(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    ));
  }

  void updateProfileData(
    String fullName,
    String email,
    String phone,
    String password,
  ) async {
    final pref = await SharedPreferences.getInstance();
    
    await pref.setString("fullName", fullName);
    await pref.setString("email", email);
    await pref.setString("phone", phone);
    await pref.setString("password", password);

    fullNameController.text = fullName;
    emailController.text = email;
    phoneController.text = phone;
    passwordController.text = password;

    emit(UpdateProfileDataState(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    ));
  }

  // void openedField() {
  //   openField = !openField;
  //   emit(OpenFieldState(openField: openField));
  // }
}
