import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/view/screens/signin_screen.dart';
import 'package:shoes_store/view/screens/signup_screen.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundGradient2(),

          //--

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_rounded,
                color: AColors.white,
                size: 50,
              ),

              //--
              Text(
                textAlign: TextAlign.center,
                "Shoes Store",
                style: TextStyle(
                  fontSize: 30,
                  color: AColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              //--

              SizedBox(height: 100),

              Text(
                textAlign: TextAlign.center,
                "Welcome Back",
                style: TextStyle(
                  fontSize: 25,
                  color: AColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              //--

              SizedBox(height: 50),

              //--
              MaterialButton(
                height: 60,
                minWidth: sw - 75,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AColors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SigninScreen(),
                    ),
                  );
                },
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                    fontSize: 20,
                    color: AColors.white,
                  ),
                ),
              ),

              //--

              SizedBox(height: 30),

              //--

              MaterialButton(
                height: 60,
                minWidth: sw - 75,
                color: AColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SignupScreen(),
                    ),
                  );
                },
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 20,
                    color: AColors.black,
                  ),
                ),
              ),

              //--

              SizedBox(height: 50),

              //-- Login With Social Media
              Column(
                children: [
                  Text(
                    "Login With Social Media",
                    style: TextStyle(color: AColors.white, fontSize: 18),
                  ),

                  //--

                  SizedBox(height: 15),

                  //--

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              maxRadius: 22,
                              backgroundColor: AColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.asset(
                                  logoAuth[index],
                                ),
                              ),

                              // Icon(
                              //   Icons.facebook,
                              // ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

List logoAuth = [
  "assets/logo_auth/google_logo.png",
  "assets/logo_auth/facebook_logo.png",
  "assets/logo_auth/twitter_logo.png",
];
