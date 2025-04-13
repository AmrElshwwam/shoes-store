import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';

class CustomRowTotalPrice extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomRowTotalPrice({
    super.key, required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          
          style: TextStyle(
            fontSize: 18,
            color: AColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),

        //-

        Text(subTitle,
          
          style: TextStyle(
            fontSize: 18,
            color: AColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
