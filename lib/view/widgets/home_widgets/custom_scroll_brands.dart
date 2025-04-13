import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/data/logo_data.dart';
import 'package:shoes_store/view/screens/brand_shoes_screen.dart';

class CustomScrollBrands extends StatelessWidget {
  const CustomScrollBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            dataLogo.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BrandShoesScreen(
                          brandName: dataLogo[index].logoName,
                        ),
                      ),
                    );
                    // print(dataLogo[index].logoName);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // تجعل العمود يأخذ حجمه فقط
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AColors.grey,
                        child: Image.asset(
                          width: 55,
                          dataLogo[index].logoImage,
                          color: AColors.white,
                        ),
                      ),

                      const SizedBox(height: 5), // مسافة بسيطة بين الصورة والنص

                      //-- Name Logo
                      Text(
                        dataLogo[index].logoName,
                        style: TextStyle(
                          fontSize: 18,
                          color: AColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
