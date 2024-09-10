// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';

class CustomMaterialBottons extends StatelessWidget {
  CustomMaterialBottons({
    this.backgroundBottonsColors,
    this.bourderRedias,
    required this.onPressed,
    required this.text,
    this.width,
    super.key,
  });
  Function() onPressed;
  Color? backgroundBottonsColors;
  String text;
  double? bourderRedias;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: MaterialButton(
        //constraints: BoxConstraints(maxWidth: 330 , maxHeight: double.infinity ),
        height: 50,
        minWidth: width ??330,

        // padding: EdgeInsets.only(left: 10),

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bourderRedias ?? 50)),
        color: backgroundBottonsColors ?? AppColors.primaryColors,
        onPressed: onPressed,
        child: Text(text, style: StylesApp.font20Madiam),
      ),
    );
  }
}
