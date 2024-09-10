import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/core/services/services_locator.dart';
import 'package:home_x/core/shared_preference/cache_helper.dart';

import 'package:home_x/core/util/app_assets.dart';
import 'package:home_x/core/util/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isOnBoardingvisited =
        getIt<CacheHelper>().getData(key: "isOnBoardingvisited") ?? false;
    if (isOnBoardingvisited == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(context, Routs.routRegisterScreen)
          : FirebaseAuth.instance.currentUser!.emailVerified == true
              ? delayedNavigate(context, Routs.routHomeScreen)
              : delayedNavigate(context, Routs.routLoginScreen);
    } else {
      delayedNavigate(context, Routs.routOnbourdingScreen);
    }
   delayedNavigate(context, Routs.routOnbourdingScreen);
    super.initState();
  }


  
    // Timer(Duration(seconds: 3), () {
    //   return Navigator.pushReplacementNamed(
    //       context, Routs.routOnbourdingScreen);
    // });
  

  @override
  Widget build(BuildContext context) {
    
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Routs.routOnbourdingScreen);
    });
    
    return const Scaffold(
      backgroundColor: AppColors.backgroundSplashScreen,
      body: Center(child: Image(image: AssetImage(Assets.assetsImagesAppIcon))),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(
    const Duration(
      seconds: 2,
    ),
    () {
      Navigator.pushReplacementNamed(context, path);

    },
  );
}
