import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_x/core/util/app_strings.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/core/util/svg_images.dart';
import 'package:home_x/feature/onbourding/ui/widgets/custom_text.dart';

// ignore: must_be_immutable
class FanContainer extends StatefulWidget {
  FanContainer({
    super.key,
  });

  bool isSwitched = false;
  @override
  State<FanContainer> createState() => _FanContainerState();
}

class _FanContainerState extends State<FanContainer> {
  bool isled = false;
  final DatabaseReference ref = FirebaseDatabase.instance.ref("esp1/");
  
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: widget.isSwitched ? null : AppColors.babyblue,
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
                child: SVGImges().blueWaves,
              ),
            ),
          Positioned(
            top: 26,
            right: 28,
            child: widget.isSwitched ? SVGImges().fanOn : SVGImges().fanOff,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 45,
                    child: Transform.scale(
                      scaleX: 1.2,
                      scaleY: 1.1,
                      child: Switch(
                        
                        value: widget.isSwitched,
                        ////////////////////////////// //////////////////////////////////
                        onChanged: (value) {
                           isled = !isled;
                      int ledStatus = isled ? 1 : 0;
                     ref.child("fan").update({"state": ledStatus}); 
                          setState(() {
                            widget.isSwitched = value;
                          });
                        },
                        ///////////////////////////////////////////////////////////////
                        inactiveThumbColor: AppColors.lightGrey,
                        thumbColor: !widget.isSwitched
                            ? const MaterialStatePropertyAll<Color>(
                                AppColors.babyblue)
                            : const MaterialStatePropertyAll<Color>(
                                AppColors.lightBlue),
                        activeTrackColor: AppColors.lightGrey,
                        inactiveTrackColor: AppColors.lightGrey,
                        trackOutlineColor:
                            const MaterialStatePropertyAll<Color>(
                                AppColors.lightGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: CustomText(
                      text: widget.isSwitched ? AppStrings.on : AppStrings.off,
                      style: StylesApp.font20Madiam.copyWith(fontSize: 15),
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
