import 'package:flutter/material.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/settings_widgets/appbar_of_settings.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

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
                bottom: false,
                child: CustomAppbarOfSettings(
                  titleAppBar: "invite_friends",
                ),
              ),

              //--

              // Add your about content here. For example:

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "invite_friends".tr(context),
                      // textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
