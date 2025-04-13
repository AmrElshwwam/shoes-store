import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/app_language_cubit.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/settings_widgets/appbar_of_settings.dart';


class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),

          //--

          Column(
            children: [
              SafeArea(
                child: CustomAppbarOfSettings(
                  titleAppBar: "choose_language",
                ),
              ),

              //--

              Center(
                child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
                  builder: (context, state) {
                    final cubit = context.read<AppLanguageCubit>();

                    if (state is ChangeLocalState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RadioListTile<String>(
                            activeColor: AColors.green,
                            radioScaleFactor: 1.5,
                            fillColor: WidgetStateProperty.all(
                                state.locale.languageCode == "en"
                                    ? AColors.green
                                    : AColors.white),
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            title: Text(
                              "english".tr(context),
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            value: 'en',
                            groupValue: state.locale.languageCode,
                            onChanged: (value) => cubit.changeLanguage(value!),
                          ),

                          //--

                          SizedBox(height: 15),

                          //--

                          RadioListTile<String>(
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            radioScaleFactor: 1.5,
                            // activeColor: AColors.green,
                            fillColor: WidgetStateProperty.all(
                                state.locale.languageCode == "ar"
                                    ? AColors.green
                                    : AColors.white),
                            title: Text(
                              "arabic".tr(context),
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            value: 'ar',
                            groupValue: state.locale.languageCode,
                            onChanged: (value) => cubit.changeLanguage(value!),
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
