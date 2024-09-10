import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothDotsIndicator extends StatelessWidget {
  const SmoothDotsIndicator({
    super.key,
    required this.controller,
    required this.count,
    required this.color,
  });

  final PageController controller;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        dotWidth: 8.w,
        dotHeight: 7.h,
        activeDotColor: color,
        dotColor: color,
      ),
    );
  }
}
