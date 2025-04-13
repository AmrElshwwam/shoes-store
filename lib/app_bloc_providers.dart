import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/cubit/add_cart_cubit.dart';
import 'package:shoes_store/cubit/app_language_cubit.dart';
import 'package:shoes_store/cubit/app_theme_cubit.dart';
import 'package:shoes_store/cubit/change_screen_cubit.dart';
import 'package:shoes_store/cubit/count_product_cart_cubit.dart';
import 'package:shoes_store/cubit/favorite_product_cubit.dart';
import 'package:shoes_store/cubit/hide_bottom_appbar_cubit.dart';
import 'package:shoes_store/cubit/total_price_cubit.dart';
import 'package:shoes_store/data/shoes_data.dart';


class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppLanguageCubit>(
          create: (_) => AppLanguageCubit()..getSavedLanguage(),
        ),
        BlocProvider<ChangeScreenCubit>(
          create: (_) => ChangeScreenCubit(),
        ),
        BlocProvider<FavoriteProductCubit>(
          create: (_) => FavoriteProductCubit(),
        ),
        BlocProvider<HideBottomAppbarCubit>(
          create: (_) => HideBottomAppbarCubit(),
        ),
        BlocProvider<TotalPriceCubit>(
          create: (_) => TotalPriceCubit(dataShoes: dataShoes),
        ),
        BlocProvider<CountProductCartCubit>(
          create: (context) => CountProductCartCubit(
            totalPriceCubit: context.read<TotalPriceCubit>(),
          ),
        ),
        BlocProvider<AddCartCubit>(
          create: (context) => AddCartCubit(
            totalPriceCubit: context.read<TotalPriceCubit>(),
            countCubit: context.read<CountProductCartCubit>(),
          ),
        ),
        BlocProvider<AppThemeCubit>(
          create: (_) => AppThemeCubit()..getCachedThemeIndex(),
        ),
      ],
      child: child,
    );
  }
}
