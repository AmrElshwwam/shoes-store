import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations({this.locale});

  final Locale? locale;

  // هنوفر نسخه من AppLocalizations بواسطة الكونتيكس الذي نعرف عن طريق مكان النص الموجود فيه حاليا
  static AppLocalizations? of(BuildContext context) {
    // نعمل ع اخبار فلاتر ان هذا الكلاس خاص ب localizations
    // لان AppLocalizations لا يورث من كلاس تعرفه فلاتر
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // هو مستودع لخزين المفاتيح للغة فيه التي يتم اختيارها
  Map<String, String> _localizedStrings = {};

  // فانكشن لتحميل المفاتيح ف التطبيق الموجوده ف ملفات جيسون
  Future loadJsonLanguage() async {
    // Load the language JSON file from the "lang" folder
    // تحميل ملف الجيسون للغة من الفولدر
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');

    // Decode the JSON string into a map of strings
    // تحويل المفاتيح من لغة جيسون الي استرينج حتي يتم استخدامها
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    // يتم تحويل القيمه تبع المفتاح الي استرينج حتي لا يسير اي خطأ
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  // This method will be called from every widget which needs a localized text
  // فانكشن تعمل علي جلب قيمة لكل مفتاح
  String translate(String key) {
    return _localizedStrings[key] ?? "";
  }
}

//------------------ AppLocalizationsDelegate ------------------

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override

  // Check if the language code is supported
  // اذا كان يدعمه يكمل شغله واذا كان لا يدعمه سيحدث خطأ
  // وتم معالجه الخطأ ف صفحة main ولكن يجب معالجته هنا ايضا لاننا نعمل اوفر رايد
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  // فانكشن تعيد تحميل الملفات مع كل تحديث لـ الواجهة
  // وعادة لا يتم استخدامها الا ف امثلة نادرة جدا
  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

//----
// extension: الكلمة المفتاحية لإنشاء امتداد (Extension) في Dart.
// on String: يعني أن هذا الامتداد يتم تطبيقه فقط على كائنات String، أي كل النصوص ("hello")
// هنا نعرّف دالة جديدة باسم tr() داخل الامتداد.
// .translate(this): this هنا تعني النص نفسه (لأننا داخل امتداد على String).
// الاستخدام قبل الاكستينشن :- // AppLocalizations.of(context)!.translate("hello"),
// وللاستخدام بعد الاكستينشن :- "hello".tr(context)

extension Translatex on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
