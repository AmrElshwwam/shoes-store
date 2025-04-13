import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shoes_store/app_bloc_providers.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/app_language_cubit.dart';
import 'package:shoes_store/cubit/app_theme_cubit.dart';
import 'package:shoes_store/view/screens/master_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const supportedLocales = [Locale('en'), Locale('ar')];

  List<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  @override
  Widget build(BuildContext context) {
    return AppBlocProviders(
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, themeState) {
          ThemeData themeData = ThemeData.light();
          if (themeState is LoadedThemeState) {
            themeData = themeState.theme;
          }

          return BlocBuilder<AppLanguageCubit,AppLanguageState>(
            builder: (context, langState) {
              if (langState is ChangeLocalState) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: themeData,
                  locale: langState.locale,
                  supportedLocales: supportedLocales,
                  localizationsDelegates: localizationsDelegates,
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    return supportedLocales.firstWhere(
                      (locale) =>
                          locale.languageCode == deviceLocale?.languageCode,
                      orElse: () => supportedLocales.first,
                    );
                  },
                  home: const MasterScreen(), // or WelcomeScreen(),
                );
              }
              return const CircularProgressIndicator(); // 👈 لو تبي تضيف لودينق هنا أحسن
            },
          );
        },
      ),
    );
  }
}
