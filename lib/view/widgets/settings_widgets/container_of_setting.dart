import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/data/settings_data.dart';

class ContainerOfSetting extends StatelessWidget {
  const ContainerOfSetting(
      {super.key, required this.index, required this.widget, this.onTap});

  final int index;
  final Widget widget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AColors.grey,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //--
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AColors.green,
                      child: Icon(
                        dataSettings[index].icon,
                        color: AColors.white,
                      ),
                    ),

                    //--

                    SizedBox(width: 20),

                    Text(
                      dataSettings[index].title.tr(context),
                      style: TextStyle(
                        color: AColors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),

                //--

                widget
              ],
            ),
          ),
        ),
      ),
    );
  }
}
