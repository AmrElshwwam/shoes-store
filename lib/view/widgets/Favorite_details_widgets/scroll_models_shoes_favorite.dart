import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/change_model_shoes_cubit.dart';
import 'package:shoes_store/cubit/favorite_product_cubit.dart';


class ScrollModelShoesFavorite extends StatelessWidget {
  const ScrollModelShoesFavorite({
    super.key,
    required this.shoesName,
    required this.shoesImage,
    required this.indexShoesModel,
  });

  final String shoesName;
  final List<String> shoesImage;
  final int indexShoesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        // color: Colors.red,
        // color: Colors.white,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                shoesImage.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: InkWell(
                      onTap: () {
                        context
                            .read<ChangeModelShoesCubit>()
                            .updateIndexModelShoes(index);

                        context
                            .read<FavoriteProductCubit>()
                            .updateModelProduct(shoesName, index);
                      },
                      child: BlocBuilder<ChangeModelShoesCubit,
                          ChangeModelShoesState>(
                        builder: (context, state) {
                          int currentIndexModels =
                              state is ChangedModelShoesState
                                  ? state.indexModelShoes
                                  : indexShoesModel;
                          return Container(
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AColors.white,
                              border: Border.all(
                                width: 5,
                                color: currentIndexModels == index
                                    ? AColors.green
                                    : AColors.white,
                                // index == 0 ? AColors.green : AColors.white,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                shoesImage[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
