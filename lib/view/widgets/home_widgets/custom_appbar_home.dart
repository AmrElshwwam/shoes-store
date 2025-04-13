import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/view/widgets/custom_icon_cart.dart';


class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: AColors.grey,
                  maxRadius: 30,
                  child: Icon(
                    Icons.person,
                    color: AColors.white,
                    size: 30,
                  ),
                ),
              ),

              //--

              SizedBox(width: 10),

              //--

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "hello".tr(context),
                    style: TextStyle(
                      color: AColors.white,
                      fontSize: 16,
                    ),
                  ),

                  //--

                  Text(
                    "Amr Medhat",
                    style: TextStyle(
                      color: AColors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),

          //--

          CustomIconCart(),
        ],
      ),
    );
  }
}
