import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_x/core/api/api.dart';
import 'package:home_x/feature/homes/homePage/views/widget_home/custom_icon.dart';
import 'package:home_x/feature/homes/homePage/views/widget_home/custom_user_info.dart';

class SectionHomeInformation extends StatelessWidget {
  const SectionHomeInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/images/common_vector.svg',
              alignment: Alignment.topRight,
            ),
          ],
        ),
         Padding(
          padding:const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomIcons(),
              CustomUserInfo(
// user: Api.me!,
              ),
            ],
          ),
        ),
        //
      ],
    );
  }
}
