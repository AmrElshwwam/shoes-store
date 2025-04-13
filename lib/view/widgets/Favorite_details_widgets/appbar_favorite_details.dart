import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/favorite_product_cubit.dart';
import 'package:shoes_store/model/shoes_model.dart';


class AppBarFavoriteDetails extends StatelessWidget {
  final String shoesName;
  final double shoesPrice;
  final List<String> shoesImage;
  final int indexShoesModel;
  final List<String> shoesSize;
  final int indexShoesSize;
  // final int index;
  const AppBarFavoriteDetails({
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
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // إعادة تعيين القيم

              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: AColors.grey,
              maxRadius: 30,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AColors.white,
                size: 30,
              ),
            ),
          ),

          //--

          Text(
            "shoes_details".tr(context),
            style: TextStyle(
              color: AColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),

          BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
            builder: (context, state) {
              bool isFavorite = false;

              if (state case UpdatedFavoriteState(:final lstFavorite)) {
                isFavorite = lstFavorite.any(
                  (product) => product.shoesName == shoesName,
                );
              }
              return InkWell(
                onTap: () {
                  // print("تم الضغط على زر الحذف");
                  if (isFavorite) {
                    context.read<FavoriteProductCubit>().removeFavorite(
                          ShoesModel(
                            shoesName: shoesName,
                            shoesPrice: shoesPrice,
                            shoesImage: shoesImage,
                            indexShoesModel: indexShoesModel,
                            shoesSize: shoesSize,
                            indexShoesSize: indexShoesModel,
                          ),
                        );
                  } else {
                    context.read<FavoriteProductCubit>().addFavorite(
                          ShoesModel(
                            shoesName: shoesName,
                            shoesPrice: shoesPrice,
                            shoesImage: shoesImage,
                            indexShoesModel: indexShoesModel,
                            shoesSize: shoesSize,
                            indexShoesSize: indexShoesModel,
                          ),
                        );
                  }
                },
                child: CircleAvatar(
                  backgroundColor: AColors.grey,
                  maxRadius: 30,
                  child: Icon(
                    Icons.favorite,
                    color: isFavorite ? AColors.red : AColors.white,
                    size: 30,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
