import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/core/services/services_locator.dart';
import 'package:home_x/core/util/app_strings.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/shared_preference/cache_helper.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/feature/onbourding/data/onbourding_model.dart';
import 'package:home_x/feature/onbourding/ui/widgets/custom_gester_detector_text.dart';
// import 'package:home_x/features/onbourding/data/onbourding_model.dart';
// import 'package:home_x/features/onbourding/ui/widgets/custom_gester_detector_text.dart';

class GetButtons extends StatefulWidget {
  const GetButtons(
      {super.key, required this.curindx, required this.controller});
  final int curindx;
  final PageController controller;

  @override
  State<GetButtons> createState() => _GetButtonsState();
}

class _GetButtonsState extends State<GetButtons> {
  @override
  Widget build(BuildContext context) {
    if (widget.curindx >= onBoardingList.length - 1) {
      return CustomGesterDetectorText(
        text: AppStrings.getStarted,
        ontap: () {
          getIt<CacheHelper>().saveData(key: "onBoardingvisited", value: true);
          Navigator.pushReplacementNamed(context, Routs.routLoginScreen);
        },
        style: StylesApp.font15Madiam.copyWith(
          color: onBoardingList[widget.curindx].color,
        ),
        arrowColor: onBoardingList[widget.curindx].color,
      );
    } else {
      return CustomGesterDetectorText(
        text: AppStrings.continueText,
        ontap: () {
          widget.controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn,
          );
          // print(widget.curindx);
        },
        style: StylesApp.font15Madiam.copyWith(
            fontSize: 16.sp, color: onBoardingList[widget.curindx].color),
        arrowColor: onBoardingList[widget.curindx].color,
      );
    }
  }
}
