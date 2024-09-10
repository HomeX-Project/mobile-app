import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/feature/ai/visitor%20screen/widgets/visitor_container.dart';

// ignore: must_be_immutable
class VisitorScreen extends StatefulWidget {
  VisitorScreen({super.key});
  bool isSwitched = false;

  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {
  bool isled = false;

  final DatabaseReference ref = FirebaseDatabase.instance.ref("esp1/");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F6FB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton(onPressed: (){},
            // icon: Icon(Icons.arrow_back)),
            Text('New Visitor', style: StylesApp.font28Madiam),
            const SizedBox(
              height: 30,
            ),
            const VisitorContainer(),
            const SizedBox(
              height: 20,
            ),
            Text('Open gate ?', style: StylesApp.font28Madiam),
            Switch(
              value: widget.isSwitched,
              onChanged: (value) {
                isled = !isled;
                int ledStatus = isled ? 1 : 0;
                ref.child("gate/").update({"state": ledStatus});
                setState(() {
                  widget.isSwitched = value;
                });
                // print(ledStatus);
              },
              inactiveThumbColor: AppColors.lightGrey,
              // thumbColor: !widget.isSwitched
              //     ?  WidgetStatePropertyAll<Color>(AppColors.lavender2)
              //     :  WidgetStatePropertyAll<Color>(
              //     AppColors.primaryColors),
              activeTrackColor: AppColors.lightGrey,
              inactiveTrackColor: AppColors.lightGrey,
              // trackOutlineColor:
                  // const WidgetStatePropertyAll<Color>(AppColors.lightGrey),
            ),
          ],
        ),
      ),
    );
  }
}
