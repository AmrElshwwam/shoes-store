import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/change_model_shoes_cubit.dart';
import 'package:shoes_store/cubit/change_size_shoes_cubit.dart';
import 'package:shoes_store/cubit/favorite_product_cubit.dart';
import 'package:shoes_store/view/widgets/Favorite_details_widgets/appbar_favorite_details.dart';
import 'package:shoes_store/view/widgets/Favorite_details_widgets/custom_show_product_favorite.dart';
import 'package:shoes_store/view/widgets/Favorite_details_widgets/scroll_models_shoes_favorite.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/custom_divider.dart';
import 'package:shoes_store/view/widgets/details_widgets/row_botton_add_buy.dart';
import 'package:shoes_store/view/widgets/favorite_screen/scroll_size_shoes_favorite.dart';


class FavoriteDetailsScreen extends StatelessWidget {
  final String shoesName;
  final double shoesPrice;
  final List<String> shoesImage;
  final int indexShoesModel;
  final List<String> shoesSize;
  final int indexShoesSize;
  // final int index;
  const FavoriteDetailsScreen({
    super.key,
    required this.shoesName,
    required this.shoesPrice,
    required this.shoesImage,
    required this.indexShoesModel,
    required this.shoesSize,
    required this.indexShoesSize,
    // required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangeModelShoesCubit>(
          create: (context) => ChangeModelShoesCubit(),
        ),
        BlocProvider<ChangeSizeShoesCubit>(
          create: (context) => ChangeSizeShoesCubit(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              //-- Background Gradient
              BackgroundGradient(),

              //--

              Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        //--
                        AppBarFavoriteDetails(
                          shoesName: shoesName,
                          shoesPrice: shoesPrice,
                          shoesImage: shoesImage,
                          indexShoesModel: indexShoesModel,
                          shoesSize: shoesSize,
                          indexShoesSize: indexShoesSize,
                          // index: index,
                        ),

                        //--

                        CustomShowProductFavorite(
                          shoesImage: shoesImage,
                          indexShoesModel: indexShoesModel,
                          // currentIndex: currentIndex, // تمرير المؤشر
                        ),

                        //--

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ScrollModelShoesFavorite(
                            shoesName: shoesName,
                            shoesImage: shoesImage,
                            indexShoesModel: indexShoesModel,
                          ),
                        ),

                        //--

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //-- Shoes Name
                              Text(
                                shoesName,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: AColors.yellow,
                                  ),
                                  Text(
                                    " (69 Reviews)",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AColors.white,
                                    ),
                                  ),
                                ],
                              ),

                              //-- Shoes Price
                            ],
                          ),
                        ),

                        //--

                        SizedBox(height: 10),

                        //--

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            shoesPrice.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: AColors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //--

                        CustomDivider(),

                        //--

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            "size".tr(context),
                            style: TextStyle(
                              fontSize: 20,
                              color: AColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        //--

                        SizedBox(height: 15),

                        //--

                        ScrollSizeShoesFavorite(
                          shoesName: shoesName,
                          shoesSize: shoesSize,
                          indexShoesSize: indexShoesSize,
                        ),

                        //--

                        SizedBox(height: 20),

                        //--
                      ],
                    ),
                  ),

                  //--

                  //---

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child:
                        BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
                      builder: (context, state) {
                        return RowBottonAddBuy(
                          shoesName: shoesName,
                          shoesPrice: shoesPrice,
                          shoesImage: shoesImage[indexShoesModel],
                          shoesSize: shoesSize[indexShoesSize],
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
