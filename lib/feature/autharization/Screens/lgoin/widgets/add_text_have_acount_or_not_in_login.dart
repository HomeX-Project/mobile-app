import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/core/util/styles.dart';

class AddDontHaveAcountOrNot extends StatelessWidget {
 const AddDontHaveAcountOrNot({ super.key});
 

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          " Don't Have An Acount ?",
          style: StylesApp.font15Madiam,
        ),
        const SizedBox(width: 5),

        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routs.routRegisterScreen);
          },
          child: Text("Sign Up",style:  TextStyle(color: Color(0xff8B78FF), fontSize: 18.sp),),
        ),
       
        // ),
      ],
    ));
  }
}
