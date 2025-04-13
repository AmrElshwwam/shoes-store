import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/cubit/change_screen_cubit.dart';
import 'package:shoes_store/data/screens_data.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/custom_bottom_appbar.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //-- Background Gradient

          BlocBuilder<ChangeScreenCubit, ChangeScreenState>(
            builder: (context, state) {
              int currentIndex =
                  state is UpdatedScreenState ? state.currentScreen : 0;

              if (currentIndex == 1) {
                return Container(
                  color: Colors.black,
                );
              }
              return BackgroundGradient();
            },
          ),

          //--

          BlocBuilder<ChangeScreenCubit, ChangeScreenState>(
            builder: (context, state) {
              int currentIndex =
                  state is UpdatedScreenState ? state.currentScreen : 0;
              return screensData[currentIndex];
            },
          ),

          //--

          CustomBottomAppbar(),

          //--
        ],
      ),
    );
  }
}
