import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_x/core/util/app_strings.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/core/util/svg_images.dart';
import 'package:home_x/feature/onbourding/ui/widgets/custom_text.dart';

// ignore: must_be_immutable
class BathLighitng extends StatefulWidget {
  BathLighitng({
    super.key,
  });

  bool isSwitched = false;
  @override
  State<BathLighitng> createState() => _BathLighitngState();
}

class _BathLighitngState extends State<BathLighitng> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref("esp1/");
  bool isled =false ;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.babyblue,
        borderRadius: BorderRadius.circular(22),
      ),
      height: 190,
      width: 174,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 45,
            child: SVGImges().bathRoomLight,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  CustomText(
                    text: widget.isSwitched ? AppStrings.on : AppStrings.off,
                    style: StylesApp.font20Madiam.copyWith(fontSize: 15),
                  ),
                  Transform.scale(
                    scaleX: 1.2,
                    scaleY: 1.1,
                    child: Switch(
                      value: widget.isSwitched,

                      onChanged: (value) {
                        isled = !isled;
                        int ledStatus = isled ? 1 : 0;
                        ref.child("leds/bath/").update({"state": ledStatus});
                        setState(() {
                          widget.isSwitched = value;
                        });
                      },
                      inactiveThumbColor: AppColors.lightGrey,
                      thumbColor: const MaterialStatePropertyAll<Color>(
                          AppColors.babyblue),
                      activeTrackColor: AppColors.lightGrey,
                      inactiveTrackColor: AppColors.lightGrey,
                      trackOutlineColor: const MaterialStatePropertyAll<Color>(
                          AppColors.lightGrey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}