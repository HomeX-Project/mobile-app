import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/feature/homes/home_feature/bathroom/bathroom.dart';
import 'package:home_x/feature/homes/home_feature/bedRoom/bed_lighing_container.dart';
import 'package:home_x/feature/homes/home_feature/Offic/OfficLighitng.dart';
import 'package:home_x/feature/homes/home_feature/kitchen/ketchen.dart';
import 'package:home_x/feature/homes/home_feature/reception/reception.dart';

class SectionHomeListAndPageView extends StatefulWidget {
  const SectionHomeListAndPageView({super.key});

  @override
  State<SectionHomeListAndPageView> createState() =>
      _SectionHomeListAndPageViewState();
}

class _SectionHomeListAndPageViewState
    extends State<SectionHomeListAndPageView> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const Reception(),
    OfficLightContainer(),
    BedLightContainer(),
    Ketchen(),
    const BathRoom(),
  ];
  List<String> list = [
    "reseptions",
    "Office",
    "bedroom",
    "Kitchen",
    "bathroom",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: double.infinity,
          decoration:  BoxDecoration(
            color: Colors.grey.shade200,// backgroundColor of list view
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // _selectedIndex = index;
                  });
                },
                child: Container(
                  height: 30.h,
                  width: 100.h,
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    list[index],
                    style: TextStyle(
                        fontSize: _selectedIndex == index ? 20.sp : 15.sp,
                        fontWeight: FontWeight.w600,
                        color: _selectedIndex == index
                            ? const Color(0xff7885FF)
                            : const Color.fromARGB(255, 136, 179, 231)),
                  ),
                ),
              );
            },
          ),
        ),
        // BuildTextListView(),
        SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: screens.length,
            controller: PageController(initialPage: _selectedIndex),
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return screens[index];
            },
          ),
        ),
      ],
    );
  }
}