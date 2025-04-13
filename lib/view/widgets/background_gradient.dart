import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/app_theme_cubit.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        // Color gradientColor = AColors.black; // اللون الافتراضي
        // if (state is LoadedThemeState) {
        //   gradientColor = state.theme.primaryColor; // الحصول على اللون من الثيم
        // }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.0, .6],
              colors: [
                AColors.green,
                Colors.black,
                //gradientColor
              ],
              begin: Alignment.topRight,
              end: Alignment.center,
            ),
          ),
        );
      },
    );
  }
}

//--

class BackgroundGradient2 extends StatelessWidget {
  const BackgroundGradient2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        // Color gradientColor = AColors.green; // اللون الافتراضي
        // if (state is LoadedThemeState) {
        //   gradientColor = state.theme.primaryColor == AColors.green
        //       ? Colors.deepOrange // لو الثيم أخضر، اجعله أورانج
        //       : state.theme.primaryColor; // غير ذلك، استخدم اللون من الثيم
        // }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //gradientColor,
                AColors.green,
                Colors.black,
              ],
              // stops: [.05, .6],
              // stops: [.0, 1],

              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        );
      },
    );
  }
}
