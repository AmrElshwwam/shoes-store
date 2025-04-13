import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';

class CustomAppbarCart extends StatelessWidget {
  final String screenName;
  final IconData icon;
  final void Function()? onTapIcon;
  const CustomAppbarCart({
    super.key,
    required this.screenName,
    required this.icon,
    required this.onTapIcon,
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
              onTap: onTapIcon,
              child: CircleAvatar(
                backgroundColor: AColors.grey,
                maxRadius: 30,
                child: Icon(
                  icon,
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

            //--

            CircleAvatar(
              backgroundColor: Colors.transparent,
              maxRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
