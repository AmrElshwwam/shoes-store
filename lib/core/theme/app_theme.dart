import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';

enum AppTheme {
  greenLight("Green Light"),
  greenDark("Green Dark");

  const AppTheme(this.name);

  final String name;
}

final appThemeData = {
  AppTheme.greenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: AColors.white,
    fontFamily: 'Roboto',
  ),
  AppTheme.greenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: AColors.black,
    fontFamily: 'Roboto',
  ),
};
