import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/view/widgets/custom_icon_cart.dart';


class CustomAppBarSearch extends StatelessWidget {
  const CustomAppBarSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              maxRadius: 30,
            ),

            //--

            Text(
              "search".tr(context),
              style: TextStyle(
                color: AColors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),

            CustomIconCart(),
          ],
        ),
      ),
    );
  }
}
