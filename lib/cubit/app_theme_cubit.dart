import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/theme/app_theme.dart';
import 'package:shoes_store/core/theme/theme_chach_helper.dart';
// import 'package:meta/meta.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  void getCachedThemeIndex() async {
    final themeIndex = await ThemeChachHelper().getCachedThemeIndex();
    final theme = AppTheme.values[themeIndex]; // استرجاع الثيم بناءً على الفهرس

    emit(LoadedThemeState(theme: appThemeData[theme]!));
  }

  void changeThemeIndex(bool isDark) {
    final newTheme = isDark ? AppTheme.greenDark : AppTheme.greenLight;
    ThemeChachHelper().cacheThemeIndex(newTheme.index); // حفظ الفهرس الجديد
    emit(LoadedThemeState(theme: appThemeData[newTheme]!));
  }
}
