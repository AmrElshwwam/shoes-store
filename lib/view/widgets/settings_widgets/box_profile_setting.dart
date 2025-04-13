import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/view/screens/profile_screen.dart';

class BoxProfileSetting extends StatelessWidget {
  const BoxProfileSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AColors.grey,
        ),
        // height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AColors.white,
                    maxRadius: 40,
                    child: Icon(
                      Icons.person,
                      color: AColors.green,
                      size: 50,
                    ),
                  ),

                  //--

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Amr Medhat",
                          style: TextStyle(
                            fontSize: 20,
                            color: AColors.white,
                          ),
                        ),
                        Text(
                          "edit_personal_details".tr(context),
                          style: TextStyle(
                            fontSize: 16,
                            color: AColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              //--

              Icon(
                Icons.arrow_forward_ios,
                color: AColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
