import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoes_store/core/language/language_cache_helper.dart';

part 'app_language_state.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  AppLanguageCubit() : super(AppLanguageInitial());

  Future<void> getSavedLanguage() async {
    final String getLanguageCode =
        await LanguageCacheHelper.getCachedLanguageCode();
    emit(ChangeLocalState(locale: Locale(getLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper.cacheLanguageCode(languageCode);
    emit(ChangeLocalState(locale: Locale(languageCode)));
  }
}
