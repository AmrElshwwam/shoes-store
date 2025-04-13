import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/add_cart_cubit.dart';

class RowBottonAddBuy extends StatelessWidget {
  const RowBottonAddBuy({
    super.key,
    required this.shoesName,
    required this.shoesPrice,
    required this.shoesImage,
    required this.shoesSize,
  });

  final String shoesName;
  final double shoesPrice;
  final String shoesImage;
  final String shoesSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AColors.green, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {
                context.read<AddCartCubit>().addProductCart(
                    shoesName, shoesPrice, shoesImage, shoesSize);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "product_added_to_cart".tr(context),
                      style: TextStyle(fontSize: 18),
                    ),
                    duration: Duration(seconds: 1),
                    backgroundColor: AColors.green,
                  ),
                );
              },
              height: 60,
              child: Text(
                "add_to_cart".tr(context),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AColors.green,
                ),
              ),
            ),
          ),

          //--
          SizedBox(width: 10),

          //-
          Expanded(
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {},
              color: AColors.green,
              height: 60,
              // minWidth: double.infinity,
              child: Text(
                "buy_now".tr(context),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
