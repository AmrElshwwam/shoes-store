import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/change_screen_cubit.dart';
import 'package:shoes_store/cubit/hide_bottom_appbar_cubit.dart';
import 'package:shoes_store/data/icon_bottom_appbar.dart';

class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HideBottomAppbarCubit, HideBottomAppbarState>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          bottom: state.isVisible ? 0 : -100, // إخفاء وإظهار الشريط
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: AColors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    4,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<ChangeScreenCubit>()
                                .updateIndexScreen(index);
                          },
                          child: BlocBuilder<ChangeScreenCubit, ChangeScreenState>(
                            builder: (context, state) {
                              int currentIndex = state is UpdatedScreenState
                                  ? state.currentScreen
                                  : 0;

                              return CircleAvatar(
                                backgroundColor: currentIndex == index
                                    ? AColors.green
                                    : AColors.white,
                                radius: 30,
                                child: Icon(
                                  iconButtonAppbar[index],
                                  color: AColors.black,
                                  size: 30,
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
      },
    );
  }
}

// List<IconData> iconButton = [
//   CupertinoIcons.home,
//   CupertinoIcons.search,
//   Icons.favorite_border,
//   Icons.person_outline_outlined,
// ];
