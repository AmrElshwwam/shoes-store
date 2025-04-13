import 'package:flutter/material.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/settings_widgets/appbar_of_settings.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),

          //--

          Column(
            children: [
              SafeArea(
                child: CustomAppbarOfSettings(
                  titleAppBar: "about_us",
                ),
              ),

              //--

              // Add your about content here. For example:

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "string_about".tr(context),
                  // textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
