import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/feature/homes/home_feature/bathroom/bath_light/bath_lighting.dart';


import 'gas/gas_container.dart';

class BathRoom extends StatefulWidget {
  const BathRoom({
    super.key,
  });

  @override
  State<BathRoom> createState() => _BathRoomState();
}

class _BathRoomState extends State<BathRoom> {
  int gas = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BathLighitng(),
        SizedBox(
          width: 16.w,
        ),
        GasContainer(),
      ],
    );
  }
}