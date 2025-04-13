import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/app_language_cubit.dart';
import 'package:shoes_store/view/screens/explore_collection_screen.dart';


class CustomBoxNewCollection extends StatelessWidget {
  const CustomBoxNewCollection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amberAccent,
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: AColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "explore_new_collection".tr(context),
                            style: TextStyle(
                              fontSize: 25,
                              color: AColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //--

                          SizedBox(height: 10),

                          //-- Material Button

                          MaterialButton(
                            height: 50,
                            minWidth: 130,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            color: AColors.black,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ExploreCollectionScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "explore_now".tr(context),
                              style: TextStyle(
                                color: AColors.white,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    //--

                    Expanded(
                      child: Container(),
                    )
                  ],
                ),
              ),
            ),
          ),

          //--

          BlocBuilder<AppLanguageCubit, AppLanguageState>(
            builder: (context, state) {
              if (state case ChangeLocalState(:final locale)) {
                // Check if the locale is Arabic
                final isArabic = locale.languageCode == 'ar';
                // Do something based on the locale
                // For example, you can change the text direction or layout
                // return Text("Language is Arabic: $isArabic");

                return Padding(
                  padding: const EdgeInsets.all(7),
                  child: Align(
                    alignment:
                        isArabic ? Alignment.centerLeft : Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: .50,
                      heightFactor: .85,
                      child: Image.asset(
                        "assets/images/shoes/adidas_black_yellow.png",
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

//-----------------------
//-----------------------
