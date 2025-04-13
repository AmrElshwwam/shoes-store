import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart' show AColors;

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        color: AColors.grey,
        height: 1,
      ),
    );
  }
}
