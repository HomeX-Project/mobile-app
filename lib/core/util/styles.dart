import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/fonts.dart';

class StylesApp {
  static TextStyle font30SemiBold = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWieghtHelper.semiBold,
      fontFamily: 'K2D',
      color: Color(0xff373737));
  static TextStyle font14Mediam = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWieghtHelper.mediam,
      fontFamily: 'K2D',
      color: Color.fromARGB(255, 83, 83, 83));

  // static Color? textColor;
  static TextStyle font20Madiam = TextStyle(
      //
      fontSize: 20.sp,
      fontWeight: FontWieghtHelper.mediam,
      fontFamily: 'K2D',
      color: Color(0xffFFFFFF));
  static TextStyle font16Madiam = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWieghtHelper.mediam,
      fontFamily: 'K2D',
      color: AppColors.primaryColors);

  static TextStyle font15Madiam = TextStyle(
    color: AppColors.gray,
    fontSize: 15.sp,
    fontFamily: "K2DRegular",
    fontWeight: FontWieghtHelper.mediam,
  );
  static TextStyle font16NormalReguler = TextStyle(
    color: AppColors.gray,
    fontSize: 16.sp,
    fontFamily: "K2DRegular",
    fontWeight: FontWieghtHelper.normalReguler,
  );
  static TextStyle font28Madiam = TextStyle(
    color: AppColors.mediumBlue,
    fontSize: 28.sp,
    fontFamily: "K2DRegular",
    fontWeight: FontWieghtHelper.mediam,
  );
}
