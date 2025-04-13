import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/change_model_shoes_cubit.dart';

class BoxShowProduct extends StatelessWidget {
  const BoxShowProduct({
    super.key,
    required this.shoesImage,
    // required this.indexShoesModel,
    // required this.currentIndex,
  });

  final List<String> shoesImage;
  // final int indexShoesModel;
  // final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<ChangeModelShoesCubit, ChangeModelShoesState>(
        builder: (context, state) {
          int currentIndexModels =
              state is ChangedModelShoesState ? state.indexModelShoes : 0;
          return Container(
            // color: Colors.amber,
            decoration: BoxDecoration(
              color: AColors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: AColors.white, width: 2),
            ),
            height: 400,
            child: Center(
              child: Image.asset(
                shoesImage[currentIndexModels],
              ),
            ),
          );
        },
      ),
    );
  }
}
