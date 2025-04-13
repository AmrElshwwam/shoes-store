import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/add_cart_cubit.dart';
import 'package:shoes_store/cubit/total_price_cubit.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/cart_widgets/custom_appbar_cart.dart';
import 'package:shoes_store/view/widgets/cart_widgets/custom_box_product.dart';
import 'package:shoes_store/view/widgets/custom_divider.dart';
import 'package:shoes_store/view/widgets/cart_widgets/custom_row_total_price.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //-

          BackgroundGradient(),

          //--

          Column(
            children: [
              CustomAppbarCart(
                screenName: "cart".tr(context),
                icon: Icons.arrow_back_ios_new,
                onTapIcon: () {
                  Navigator.pop(context);
                },
              ),

              //--

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: BlocBuilder<AddCartCubit, AddCartState>(
                          builder: (context, state) {
                            if (state is AddCartInitial) {
                              return Text(
                                "Not Find Product In Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              );
                            } else if (state is UpdatedCartState) {
                              return Column(
                                children: [
                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: state.dataShoes.length,
                                    itemBuilder: (context, index) {
                                      return CustomBoxProduct(
                                        nameShoes:
                                            state.dataShoes[index].shoesName,
                                        priceShoes:
                                            state.dataShoes[index].shoesPrice,
                                        sizeShoes: state
                                            .dataShoes[index].shoesSize.first,
                                        imageShoes: state
                                            .dataShoes[index].shoesImage.first,
                                        indexProduct: index,
                                      );
                                    },
                                  ),

                                  //--

                                  CustomDivider(),

                                  //-
                                  BlocBuilder<TotalPriceCubit, TotalPriceState>(
                                    builder: (context, state) {
                                      if (state is TotalPriceUpdated) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomRowTotalPrice(
                                                title: "price".tr(context),
                                                subTitle:
                                                    "${state.subTotal.toStringAsFixed(2)} \$"),

                                            //--
                                            CustomRowTotalPrice(
                                                title: "delivery_fee".tr(context),
                                                subTitle:
                                                    "${state.delivery.toStringAsFixed(2)} \$"),

                                            //-
                                            CustomRowTotalPrice(
                                                title: "discount".tr(context),
                                                subTitle:
                                                    "- ${state.discount.toStringAsFixed(2)} \$"),

                                            //-
                                            CustomDivider(),

                                            //-
                                            CustomRowTotalPrice(
                                                title: "total".tr(context),
                                                subTitle:
                                                    "${state.total.toStringAsFixed(2)} \$"),
                                          ],
                                        );
                                      }
                                      return SizedBox();
                                    },
                                  ),
                                ],
                              );
                            }
                            return Container(); // لا يمكن الوصول إليها
                            //
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //---
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {},
                  color: AColors.green,
                  height: 60,
                  minWidth: double.infinity,
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
