import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/view/widgets/search_widgets/custom_appbar_search.dart';
import 'package:shoes_store/view/widgets/search_widgets/text_field_search.dart';


class CustomStackSearch extends StatelessWidget {
  const CustomStackSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        // color: AColors.green,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              gradient: RadialGradient(
                radius: 3,
                colors: [
                  AColors.green,
                  Colors.black,
                ],
              ),
            ),
          ),

          //--

          SafeArea(
            bottom: false,
            child: CustomAppBarSearch(),
          ),

          //--

          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              // color: Colors.red,
              height: 80,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: TextFieldSearch(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
