import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/view/screens/see_all_screen.dart';


class CustomTextStores extends StatelessWidget {
  const CustomTextStores({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "stores".tr(context),
            style: TextStyle(
              fontSize: 30,
              color: AColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          //--
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SeeAllScreen(),
                ),
              );
            },
            child: Text(
              "see_all".tr(context),
              style: TextStyle(
                fontSize: 18,
                color: AColors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
