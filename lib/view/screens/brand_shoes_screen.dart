import 'package:flutter/material.dart';
import 'package:shoes_store/data/shoes_data.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/custom_appbar.dart';
import 'package:shoes_store/view/widgets/wrap_list_products.dart';


class BrandShoesScreen extends StatelessWidget {
  final String brandName;
  const BrandShoesScreen({super.key, required this.brandName});

  @override
  Widget build(BuildContext context) {
    var lstBrand = dataShoes
        .where((shoes) =>
            shoes.shoesName.toLowerCase().contains(brandName.toLowerCase()))
        .toList();
    return Scaffold(
      body: Stack(
        children: [
          //-

          BackgroundGradient(),
          //-- AppBar

          Column(
            children: [
              CustomAppbar(
                screenName: brandName,
              ),

              //-- Body
              Expanded(
                child: SingleChildScrollView(
                  child: WrapListProducts(
                    dataShoes: lstBrand,
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
