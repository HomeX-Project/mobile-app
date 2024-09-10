import 'package:flutter/material.dart';
import 'package:home_x/core/util/svg_images.dart';

class OnBoardingModel {
  final String title;
  final String subTitle1;
  final Widget image;
  final Color color;
  OnBoardingModel({
    required this.image,
    required this.color,
    required this.title,
    required this.subTitle1,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: 'Welcome to Your\nSmart home',
    subTitle1:
        'Your home now is equipped with the latest technology to make your life easier, organized and more comfortable.\n\n with the help of your smart home app you can control various aspects of your home with just a few taps on your phone.',
    image: Image.asset("assets/images/home_icon.png" , width: 110, height: 110,),
    color: const Color(0xFF88B5FF),
  ),
  OnBoardingModel(
    title: 'Easy control\nwherever you Are',
    subTitle1:
        'Now you can control your home appliances easily and comfortably  from wherever you are , just connect to the Wi-Fi and control the Home Instantly.',
    image: Image.asset("assets/images/wheather.png" , width: 150, height: 150,),
    color: const Color(0xFF7885FF),
  ),
  OnBoardingModel(
    title: 'AI makes it Smarter',
    subTitle1:
        'AI makes your Home more Secured, Smart Identification and Access became more easier with Homex , now you can Detect who on the gate and give him permission to enter by just simple tap from your smart phone. ',
    image:Image.asset("assets/images/face_recognition- 2.png" , width: 120, height: 120,),
    color: const Color(0xFF8B78FF),
  ),
];
