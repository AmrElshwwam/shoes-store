import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/add_cart_cubit.dart';
import 'package:shoes_store/view/screens/cart_screen.dart';


class CustomIconCart extends StatelessWidget {
  const CustomIconCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleAvatar(
            backgroundColor: AColors.grey,
            maxRadius: 30,
            child: Icon(
              CupertinoIcons.cart,
              color: AColors.white,
              size: 30,
            ),
          ),
          BlocBuilder<AddCartCubit, AddCartState>(
            builder: (context, state) {
              if (state is UpdatedCartState) {
                return CircleAvatar(
                  backgroundColor: AColors.red,
                  maxRadius: 15,
                  child: Text(
                    state.dataShoes.length.toString(),
                    style: TextStyle(color: AColors.white, fontSize: 16),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
