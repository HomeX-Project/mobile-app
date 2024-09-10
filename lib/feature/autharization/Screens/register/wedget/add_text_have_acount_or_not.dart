import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/core/util/styles.dart';

class AddTextDoYouHaveAcountOrNot extends StatelessWidget {
 const AddTextDoYouHaveAcountOrNot({ super.key});
 

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
         Text(
          " Do Have Already Acount?",
          style: StylesApp.font15Madiam,
        ),
         SizedBox(width: 5.w),

        TextButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, Routs.routLoginScreen , (Route<dynamic> route) => false);
          },
          child: Text("Sign In",style:  TextStyle(color: Color(0xff8B78FF), fontSize: 18.sp),),
        ),
       
      ],
    ));
  }
}
