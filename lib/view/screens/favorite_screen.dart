import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/favorite_product_cubit.dart';
import 'package:shoes_store/cubit/hide_bottom_appbar_cubit.dart';
import 'package:shoes_store/view/widgets/favorite_screen/custom_appbar_favorite.dart';
import 'package:shoes_store/view/widgets/favorite_screen/wrap_list_products_favorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //-- AppBar

        AppBarFavorite(),

        //-- Body
        Expanded(
          child: BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
            builder: (context, state) {
              if (state is UpdatedFavoriteState) {
                return SingleChildScrollView(
                    controller: context
                        .read<HideBottomAppbarCubit>()
                        .scrollController,
                    child: WrapListProductsFavorite(
                      dataShoes: state.lstFavorite,
                      // indexShoesModel: state.indexShoesModel!,
                    ));
              } else if (state is FavoriteProductInitial) {
                return Center(
                  child: Text(
                    "don't have favorites".tr(context),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        )
      ],
    );
  }
}
