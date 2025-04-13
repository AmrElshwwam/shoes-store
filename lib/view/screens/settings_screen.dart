import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/app_theme_cubit.dart';
import 'package:shoes_store/cubit/hide_bottom_appbar_cubit.dart';
import 'package:shoes_store/data/settings_data.dart';
import 'package:shoes_store/view/widgets/settings_widgets/box_profile_setting.dart';
import 'package:shoes_store/view/widgets/settings_widgets/container_of_setting.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: context.read<HideBottomAppbarCubit>().scrollController,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              //- AppBar

              Center(
                child: Text(
                  "settings".tr(context),
                  style: TextStyle(
                    color: AColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //--

              SizedBox(height: 20),

              //-- Body

              //--Box Profile Setting
              BoxProfileSetting(),

              //--

              SizedBox(height: 20),

              //-

              ListView.builder(
                shrinkWrap: true,
                itemCount: dataSettings.length,
                itemBuilder: (context, index) {
                  return index == 0
                      ? ContainerOfSetting(
                          index: index,
                          // onTap: () {},
                          widget: BlocBuilder<AppThemeCubit, AppThemeState>(
                            builder: (context, state) {
                              bool isDarkTheme = false; // القيمة الافتراضية

                              if (state is LoadedThemeState) {
                                isDarkTheme =
                                    state.theme.brightness == Brightness.dark;
                              }

                              return Switch(
                                activeColor: AColors.green,
                                inactiveTrackColor: Colors.white,
                                inactiveThumbColor: AColors.green,
                                value:
                                    isDarkTheme, // ✅ الآن يحصل على القيمة الحقيقية
                                onChanged: (value) {
                                  context
                                      .read<AppThemeCubit>()
                                      .changeThemeIndex(value);
                                },
                              );
                            },
                          ),
                        )
                      : index == 2
                          ? ContainerOfSetting(
                              index: index,
                              // onTap: () {},
                              widget: Switch(
                                activeColor: AColors.green,
                                inactiveTrackColor: Colors.white,
                                inactiveThumbColor: AColors.green,
                                value: false,
                                onChanged: (value) {},
                              ),
                            )
                          : ContainerOfSetting(
                              index: index,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        dataSettings[index].screen!,
                                  ),
                                );
                              },
                              widget: Icon(
                                Icons.arrow_forward_ios,
                                color: AColors.white,
                              ),
                            );
                },
              ),

              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
