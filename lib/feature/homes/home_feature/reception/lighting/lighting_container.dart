import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_x/core/util/app_strings.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/core/util/svg_images.dart';
import 'package:home_x/feature/onbourding/ui/widgets/custom_text.dart';

// ignore: must_be_immutable
class LightingContainer extends StatefulWidget {
  LightingContainer({
    super.key,
  });

  bool isSwitched = false;
  @override
  State<LightingContainer> createState() => _LightingContainerState();
}


class _LightingContainerState extends State<LightingContainer> {

  bool isled = false;
  final DatabaseReference ref = FirebaseDatabase.instance.ref("esp1/");

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: widget.isSwitched ? null : AppColors.lavender,
        borderRadius: BorderRadius.circular(22),
      ),
      height: 190,
      width: 174,
      child: Stack(
        children: [
          if (widget.isSwitched)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SVGImges().purpleWaves,
              ),
            ),
          Positioned(
            top: 0,
            right: 0,
            child: widget.isSwitched ? SVGImges().lampaOn : SVGImges().lampaOff,
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
                     ref.child("leds/reception/").update({"state": ledStatus}); 
                        setState(() {
                          widget.isSwitched = value;
                        });
                        print(ledStatus);
                      },
                      inactiveThumbColor: AppColors.lightGrey,
                      thumbColor: !widget.isSwitched
                          ? const MaterialStatePropertyAll<Color>(
                              AppColors.lavender)
                          : const MaterialStatePropertyAll<Color>(
                              AppColors.primaryColors),
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
