import 'package:flutter/material.dart';
import 'package:shoes_store/core/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.sw,
    required this.textButton,
    this.onTap,
  });

  final double sw;
  final String textButton;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: Colors.transparent, // اجعل الخلفية شفافة
      child: Ink(
        width: sw,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              AColors.green,
              Colors.black,
            ],
            stops: [0.05, 0.6],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          splashColor: AColors.white.withValues(alpha: .2),
          // hoverColor: Colors.black,
          // highlightColor: Colors.black,
          onTap: onTap,
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
