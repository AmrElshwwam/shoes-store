import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';

class CustomAppbarOfSettings extends StatelessWidget {
  const CustomAppbarOfSettings({
    super.key,
    required this.titleAppBar,
  });

  final String titleAppBar;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            // "chooseLanguage".tr(context),
            titleAppBar.tr(context),
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
          )
        ],
      ),
    );
  }
}
