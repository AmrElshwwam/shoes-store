import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormValidationCubit extends Cubit<Map<String, String?>> {
  FormValidationCubit() : super({});

  // Controllers لكل TextField
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final passwordSignInController = TextEditingController();
  final emailSignInController = TextEditingController();

  void validateField(String fieldName, String value) {
    if (value.isEmpty) {
      emit({...state, fieldName: "This field is required"});
    } else if (fieldName == "Full Name" && value.length < 6) {
      emit({...state, fieldName: "Name must be at least 6 characters"});
    } else if (fieldName == "Email" &&
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      emit({...state, fieldName: "Enter a valid email"});
    } else if (fieldName == "Phone" && !RegExp(r'^\d{11}$').hasMatch(value)) {
      emit({...state, fieldName: "Enter a valid phone number"});
    } else if (fieldName == "Password" && value.length < 6) {
      emit({...state, fieldName: "Password must be at least 6 characters"});
    } else {
      emit({...state, fieldName: null});
    }
  }

  // تحقق من جميع الحقول دفعة واحدة
  bool validateAllFields() {
    validateField("Full Name", fullNameController.text);
    validateField("Phone", phoneController.text);
    validateField("Email", emailController.text);
    validateField("Password", passwordController.text);

    return state.values.every((error) => error == null);
  }

  // حفظ البيانات في SharedPreferences
  Future<void> saveData() async {
    // المفروض هنا نعمل اتشيك الاول لو كان فيه نفس الايميل او الفون
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("fullName", fullNameController.text);
    await prefs.setString("phone", phoneController.text);
    await prefs.setString("email", emailController.text);
    await prefs.setString("password", passwordController.text);
  }

  Future<String> signIn() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedEmail = prefs.getString("email");
    final String? storedPassword = prefs.getString("password");

    if (storedEmail == null || storedPassword == null) {
      return "Email or password Not available";
    } else if (storedEmail != emailSignInController.text) {
      return "Incorrect Email";
    } else if (storedPassword != passwordSignInController.text) {
      return "Incorrect Password";
    }

    return "";
  }
}
