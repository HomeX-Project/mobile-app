import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/feature/homes/home_feature/reception/fan/fan%20_container.dart';

import 'lighting/lighting_container.dart';

class Reception extends StatelessWidget {
  const Reception({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        LightingContainer(),
        SizedBox(width: 16.w,),
        FanContainer(),
      ],
    );
  }
}