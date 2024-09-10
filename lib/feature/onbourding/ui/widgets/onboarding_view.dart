import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/feature/onbourding/data/onbourding_model.dart';
import 'package:home_x/feature/onbourding/ui/widgets/onboarding_container.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: PageView.builder(
        controller: controller,
        itemCount: onBoardingList.length,
        physics: const BouncingScrollPhysics(),

        itemBuilder: (context, index) => OnbourdingContainer(
          controller: controller,
          onBoardingModel: onBoardingList[index],
          curindx: index,
        ),
      ),
    );
  }
}
