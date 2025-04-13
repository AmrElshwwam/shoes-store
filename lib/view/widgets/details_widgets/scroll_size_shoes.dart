import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/change_size_shoes_cubit.dart';

class ScrollSizeShoes extends StatelessWidget {
  const ScrollSizeShoes({
    super.key,
    required this.shoesSize,
  });

  final List<String> shoesSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        // color: Colors.yellow,
        height: 40,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              shoesSize.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      context
                          .read<ChangeSizeShoesCubit>()
                          .updateIndexModelShoes(index);
                    },
                    child:
                        BlocBuilder<ChangeSizeShoesCubit, ChangeSizeShoesState>(
                      builder: (context, state) {
                        int currentIndexSize = state is ChangedSizeShoesState
                            ? state.indexSizeShoes
                            : 0;
                        return Container(
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: currentIndexSize == index
                                ? AColors.green
                                : AColors.grey.withValues(alpha: .5),
                            border: Border.all(
                              width: 2,
                              color: currentIndexSize == index
                                  ? AColors.green
                                  : Colors.white,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              shoesSize[index],
                              style: TextStyle(
                                fontSize: 20,
                                color: AColors.white,
                                fontWeight: FontWeight.w500,
                              ),
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
    );
  }
}

