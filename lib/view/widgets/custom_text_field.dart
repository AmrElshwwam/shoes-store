import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';

class CustomTitleTextField extends StatelessWidget {
  const CustomTitleTextField({
    super.key,
    required this.titleField,
    required this.hintField,
    this.suffixIcon,
    this.obscureText = false,
    this.onTapIconSuffix,
    this.onChanged,
    this.errorText,
    this.controller,
  });

  final String titleField;
  final String hintField;
  final IconData? suffixIcon;
  final void Function()? onTapIconSuffix;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? errorText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titleField,
            style: TextStyle(
              fontSize: 22,
              color: AColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        //--

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            controller: controller,
            onChanged: onChanged, // <-- تحديث الفاليديشن عند تغيير النص
            obscureText: obscureText,
            style: TextStyle(color: AColors.black),
            cursorColor: AColors.black,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: IconButton(
                  onPressed: onTapIconSuffix,
                  icon: Icon(suffixIcon),
                ),
              ),
              hintText: hintField,
              hintStyle: TextStyle(
                color: AColors.greyBorderField,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AColors.greyBorderField,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AColors.green,
                  width: 2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              errorText: errorText, // <-- عرض الخطأ عند الحاجة
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
