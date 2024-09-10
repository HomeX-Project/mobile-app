import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_x/core/api/api.dart';
import 'package:home_x/core/helper/helper.dart';
import 'package:home_x/core/modal/user_modal.dart';
import 'package:home_x/core/util/app_assets.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/feature/autharization/Screens/lgoin/widgets/add_text_login_title.dart';
import 'package:home_x/feature/autharization/Screens/lgoin/widgets/refactor_custom_text_form_field.dart';
import 'package:home_x/feature/homes/icon_navigation/icon_navigate.dart';
import 'add_text_have_acount_or_not_in_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginBodyScreen extends StatefulWidget {
   const LoginBodyScreen({
    super.key,
  });

  @override
  State<LoginBodyScreen> createState() => _LoginBodyScreenState();
}

class _LoginBodyScreenState extends State<LoginBodyScreen> {
   Future<UserCredential?> signInWithGoogle() async {
     // Trigger the authentication flow
     try{
       await InternetAddress.lookup("google.com") ;
       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
       // Obtain the auth details from the request
       final GoogleSignInAuthentication? googleAuth = await googleUser
           ?.authentication;
       // Create a new credential
       final credential = GoogleAuthProvider.credential(
         accessToken: googleAuth?.accessToken,
         idToken: googleAuth?.idToken,
       );
       // Once signed in, return the UserCredential
       return await Api.auth.signInWithCredential(credential);
     }catch(e){
       print("error message $e") ;
       Dialogs.showSnakBar(context, "Some thing is wrong check internet") ;
       return  null;
     }
   }

   builtSignInWithGoogle() {
     Dialogs.showProgressBar(context);
     Navigator.of(context).pop();
     signInWithGoogle().then((value) async{
       if(value != null){
         if((await Api.userExist())){
           ChatUser? userData = await Api.getSetInfo();
           Navigator.of(context).pushReplacement(
               MaterialPageRoute(builder: (context) => NavigationIcon())
           );
         }else{
           await Api.createUser().then((value)async {
             ChatUser? userData = await Api.getSetInfo();
             Navigator.of(context).pushReplacement(
                 MaterialPageRoute(builder: (context) => NavigationIcon())
             );
           });
         }

       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: 40.h,
          ),
          Center(child: Image.asset(Assets.assetsImagesAppIcon)),
        const  Center(child:  AddTextLoginTitle()),
           SizedBox(
            height: 30.h,
          ),
          RefactorCustomTextFormFieldAndAddValidationsInLoginScreen(),
           SizedBox(
            height: 20.h,
          ),
           const AddDontHaveAcountOrNot(),
          SizedBox(
            height: 16.h,
          ),
          Row(
              children: <Widget>[
                Expanded(
                    child: Divider(
                      color: Colors.black54,
                    )
                ),
                SizedBox(
                  width: 6.h,
                ),
                Text("OR"),
                SizedBox(
                  width: 6.h,
                ),
                Expanded(
                    child: Divider(
                      color: Colors.black54,
                    )
                ),
              ]
          ),

          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(

                style:ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50),
                  backgroundColor: AppColors.primaryColors,
                ),
                onPressed: (){
                  builtSignInWithGoogle() ;

                  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => NavigationIcon())) ;
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("Sign in with google",style:  TextStyle(
                      color: Colors.white,

                    )),
                    SizedBox(width: 30,),
                    Image.asset("assets/images/google.png" , height: 30, width :30,) ,
                  ],
                )),
          ),

        ],
      ),
    );
  }
}
