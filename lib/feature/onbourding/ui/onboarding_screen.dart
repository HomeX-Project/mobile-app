import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/core/services/services_locator.dart';
import 'package:home_x/core/util/app_strings.dart';

import 'package:home_x/core/shared_preference/cache_helper.dart';
import 'package:home_x/feature/autharization/Screens/lgoin/ui/login_screen.dart';
import 'package:home_x/feature/onbourding/data/onbourding_model.dart';
import 'package:home_x/feature/onbourding/ui/widgets/onboarding_body_screen.dart';
// import 'package:home_x/features/onbourding/data/onbourding_model.dart';
// import 'package:home_x/features/onbourding/ui/widgets/onboarding_body_screen.dart';

class OnbourdingScreen extends StatefulWidget {
  const OnbourdingScreen({
    super.key,
  });
  @override
  State<OnbourdingScreen> createState() => _OnbourdingScreenState();
}

class _OnbourdingScreenState extends State<OnbourdingScreen> {
  final PageController controller = PageController();
  int curindx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20.sp, top: 30.sp),
            child:TextButton(
              onPressed: (){
                print("skip");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => LoginScreen() ));
              },
              child:  Text(AppStrings.skip,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  )),

            ),
          ),
        ),
        PageView.builder(
          controller: controller,
          itemCount: onBoardingList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => OnBourdingBodyScreen(
            controller: controller,
            curindx: index,
            model: onBoardingList[index],
          ),
          onPageChanged: updateIndex,
        ),
      ]),
      backgroundColor: onBoardingList[curindx].color,
    );
  }

  void updateIndex(int newIndex) {
    setState(() {
      curindx = newIndex;
    });
  }
}


