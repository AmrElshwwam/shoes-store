import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/view/widgets/custom_icon_cart.dart';

class CustomAppbar extends StatelessWidget {
  final String screenName;
  // final Color colorName;
  const CustomAppbar({
    super.key,
    required this.screenName,
    // required this.colorName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: AColors.grey,
                maxRadius: 30,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AColors.white,
                  size: 30,
                ),
              ),
            ),

            //--

            Text(
              screenName,
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
