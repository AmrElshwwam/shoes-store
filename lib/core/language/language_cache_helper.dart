import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  static const String _languageKey = 'language';

  static Future<void> cacheLanguageCode(String language) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_languageKey, language);

    //-- طريقه تانيه للمعرفة
    // await SharedPreferences.getInstance().then((prefs) {
    //   prefs.setString(_languageKey, language);
    // });
  }

  static Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    // final cachedLanguageCode =
    //     sharedPreferences.getString(_languageKey) ?? "en";
    return sharedPreferences.getString(_languageKey) ?? 'en';

    //-- طريقه تانيه للمعرفة
    // return await SharedPreferences.getInstance().then((prefs) {
    //   return prefs.getString(_languageKey) ?? 'en';
    // });
  }
}
