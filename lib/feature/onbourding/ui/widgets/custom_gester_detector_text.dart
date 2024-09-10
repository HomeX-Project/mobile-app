import 'package:flutter/material.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';

class CustomGesterDetectorText extends StatelessWidget {
  const CustomGesterDetectorText({
    super.key,
    required this.ontap,
    required this.text,
    this.style,
    this.arrowColor,
  });
  final String text;
  final VoidCallback ontap;
  final TextStyle? style;
  final Color? arrowColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        children: [
          Text(
            text,
            style: style ?? StylesApp.font15Madiam,
          ),
           Icon(
            Icons.arrow_forward,
            color: arrowColor ?? AppColors.gray,
          )
        ],
      ),
    );
  }
}
