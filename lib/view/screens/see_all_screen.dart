import 'package:flutter/material.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/data/shoes_data.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/custom_appbar.dart';
import 'package:shoes_store/view/widgets/wrap_list_products.dart';


class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),
          //-- AppBar

          Column(
            children: [
              CustomAppbar(
                screenName: "collections".tr(context),
              ),

              //-- Body
              Expanded(
                child: SingleChildScrollView(
                  child: WrapListProducts(
                    dataShoes: dataShoes,
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
