import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/change_model_shoes_cubit.dart';
import 'package:shoes_store/cubit/change_size_shoes_cubit.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/custom_divider.dart';
import 'package:shoes_store/view/widgets/details_widgets/box_show_product.dart';
import 'package:shoes_store/view/widgets/details_widgets/custom_appbar_details.dart';
import 'package:shoes_store/view/widgets/details_widgets/row_botton_add_buy.dart';
import 'package:shoes_store/view/widgets/details_widgets/scroll_models_shoes.dart';
import 'package:shoes_store/view/widgets/details_widgets/scroll_size_shoes.dart';

class DetailsScreen extends StatelessWidget {
  final String shoesName;
  final double shoesPrice;
  final List<String> shoesImage;
  // final int indexShoesModel;
  final List<String> shoesSize;
  final int index;
  const DetailsScreen({
    super.key,
    required this.shoesName,
    required this.shoesPrice,
    required this.shoesImage,
    // required this.indexShoesModel,
    required this.shoesSize,
    required this.index,
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
                        BlocBuilder<ChangeModelShoesCubit,
                            ChangeModelShoesState>(
                          builder: (context, state) {
                            int indexShoesModel =
                                (state is ChangedModelShoesState)
                                    ? state.indexModelShoes
                                    : 0;
                            return BlocBuilder<ChangeSizeShoesCubit,
                                ChangeSizeShoesState>(
                              builder: (context, state) {
                                int indexShoesSize =
                                    (state is ChangedSizeShoesState)
                                        ? state.indexSizeShoes
                                        : 0;
                                return CustomAppbarDetails(
                                  shoesName: shoesName,
                                  shoesPrice: shoesPrice,
                                  shoesImage: shoesImage,
                                  indexShoesModel: indexShoesModel,
                                  shoesSize: shoesSize,
                                  indexShoesSize: indexShoesSize,
                                  index: index,
                                );
                              },
                            );
                          },
                        ),

                        //--

                        BoxShowProduct(
                          shoesImage: shoesImage,
                          // currentIndex: currentIndex, // تمرير المؤشر
                        ),

                        //--

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ScrollModelsShoes(shoesImage: shoesImage),
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

                        ScrollSizeShoes(
                          shoesSize: shoesSize,
                        ),

                        //--

                        SizedBox(height: 20),

                        //--
                      ],
                    ),
                  ),

                  //--

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: BlocBuilder<ChangeModelShoesCubit,
                        ChangeModelShoesState>(
                      builder: (context, state) {
                        int currentModel = (state is ChangedModelShoesState)
                            ? state.indexModelShoes
                            : 0;

                        return BlocBuilder<ChangeSizeShoesCubit,
                            ChangeSizeShoesState>(
                          builder: (context, state) {
                            int currentSize = (state is ChangedSizeShoesState)
                                ? state.indexSizeShoes
                                : 0;
                            return RowBottonAddBuy(
                              shoesName: shoesName,
                              shoesPrice: shoesPrice,
                              shoesImage: shoesImage[currentModel],
                              shoesSize: shoesSize[currentSize],
                            );
                          },
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
