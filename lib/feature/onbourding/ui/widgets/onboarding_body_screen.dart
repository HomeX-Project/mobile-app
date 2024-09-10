import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/feature/onbourding/data/onbourding_model.dart';
import 'package:home_x/feature/onbourding/ui/widgets/onboarding_container.dart';
// import 'package:home_x/features/onbourding/data/onbourding_model.dart';
// import 'package:home_x/features/onbourding/ui/widgets/onboarding_container.dart';

class OnBourdingBodyScreen extends StatelessWidget {
  const OnBourdingBodyScreen({
    super.key,
    required this.controller,
    required this.model,
    required this.curindx,
  });

  final PageController controller;
  final OnBoardingModel model;
  final int curindx;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 80.h,
        ),

        Align(alignment: Alignment.center, child: model.image),
      
        Align(
          alignment: Alignment.bottomCenter,
          child: OnbourdingContainer(
            onBoardingModel: model,
            controller: controller,
            curindx: curindx,
          ),
        ),

      ],
    );
  }
}