import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/add_cart_cubit.dart';
import 'package:shoes_store/cubit/count_product_cart_cubit.dart';

class CustomBoxProduct extends StatelessWidget {
  const CustomBoxProduct({
    super.key,
    required this.imageShoes,
    required this.nameShoes,
    required this.sizeShoes,
    required this.priceShoes,
    required this.indexProduct,
  });

  final String imageShoes;
  final String nameShoes;
  final String sizeShoes;
  final double priceShoes;
  final int indexProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AColors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    //-- Image
                    Center(
                      child: Image.asset(imageShoes),
                    ),

                    //--
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          context
                              .read<AddCartCubit>()
                              .removeProductCart(nameShoes);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: AColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //-

              SizedBox(width: 10),

              //-

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameShoes,
                    //"Addids Air 2025",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AColors.white,
                    ),
                  ),

                  //-

                  Text(
                    // sizeShoes,
                    "Size: $sizeShoes",
                    style: TextStyle(
                      fontSize: 18,
                      color: AColors.white,
                    ),
                  ),

                  //-

                  Text(
                    priceShoes.toString(),
                    // "100\$",
                    style: TextStyle(
                      fontSize: 18,
                      color: AColors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              //-

              Spacer(),

              //--

              Container(
                height: 120,
                // width: 50,
                decoration: BoxDecoration(
                  color: AColors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    3,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<CountProductCartCubit>()
                              .increaseProductCart(nameShoes);
                          
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AColors.green,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      //-

                      BlocBuilder<CountProductCartCubit, CountProductCartState>(
                        builder: (context, state) {
                          int count = 1; // القيمة الافتراضية

                          if (state is UpdateProductCartState) {
                            count = state.productCounts[nameShoes] ?? 1;
                          }

                          return Text(
                            "$count",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AColors.black,
                            ),
                          );
                        },
                      ),

                      //-

                      InkWell(
                        onTap: () {
                          context
                              .read<CountProductCartCubit>()
                              .decreaseProductCart(nameShoes);
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AColors.white,
                          child: Icon(
                            Icons.remove,
                            color: AColors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
