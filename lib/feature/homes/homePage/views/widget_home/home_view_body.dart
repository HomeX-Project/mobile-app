import 'package:flutter/material.dart';
import 'package:home_x/feature/homes/homePage/views/widget_home/section_home_info.dart';
import 'package:home_x/feature/homes/homePage/views/widget_home/section_list_page_view.dart';
import 'package:home_x/test_code.dart/text_animation.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      physics: const BouncingScrollPhysics(),
      children: [
       
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHomeInformation(),
          const SizedBox(
            height: 25,
          ),
          const SectionHomeListAndPageView(),
         // const SizedBox(height: 110),
          // Container(
          //   height: 100,
          //   color: Colors.grey[200],
          // ),
        ],
      ),
      ],
    );
  }
}