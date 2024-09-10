// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/core/util/styles.dart';

class AddTextBottonForgetPassword extends StatelessWidget {
  const AddTextBottonForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     // alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal:18 , vertical: 16),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
              context, Routs.routForgetPasswordScreen);
        },
        
        child:  Text("Forget Password ?", style: StylesApp.font16Madiam,),
      ),
    );
  }
}