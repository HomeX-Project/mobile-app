// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_x/core/modal/user_modal.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/constant.dart';
import 'package:home_x/core/widgets/custom_material_bottons.dart';
import 'package:home_x/core/widgets/custom_text_field.dart';
import 'package:home_x/feature/autharization/Screens/register/wedget/add_text_have_acount_or_not.dart';
import 'package:home_x/feature/autharization/date/auth_register/auth_register_cubit.dart';
import "package:home_x/core/api/api.dart" ;
import "package:home_x/core/helper/helper.dart" ;
import 'package:home_x/feature/homes/homePage/views/widget_home/drop_down.dart';
import 'package:home_x/feature/homes/icon_navigation/icon_navigate.dart';
import "package:flutter_screenutil/flutter_screenutil.dart" ;
import 'package:home_x/feature/onbourding/data/on_bourd.dart';

import '../../../date/auth_register/auth_register_state.dart';
class RefactorCustomTextFormFieldAndAddValidationInRegisterScreen
    extends StatefulWidget {
  RefactorCustomTextFormFieldAndAddValidationInRegisterScreen({super.key });
  

 // static getUserName(){
 //   return userName ;
 // }

  @override
  State<RefactorCustomTextFormFieldAndAddValidationInRegisterScreen> createState() => _RefactorCustomTextFormFieldAndAddValidationInRegisterScreenState();
}

class _RefactorCustomTextFormFieldAndAddValidationInRegisterScreenState extends State<RefactorCustomTextFormFieldAndAddValidationInRegisterScreen> {
  String? email;
   String? userName;
  String? password;
  bool passwordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();

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
    return Form(
      key: formKey,
      child: Column(
        children: [
           SizedBox(
            height: 30.h,
          ),
          CustomTextFormField(
            onSaved: (val) => Api.me!.name = val ??"UnKnown" ,
            lableText: 'User Name',
            prefixIcon: const Icon(Icons.person),
            inputType: TextInputType.name,
            onChange: (data) {
              userName = data;
            },

            validator: (value) {
              if (value!.isEmpty) {
                return " please inter user name";
              }
              return null;
            },
          ),
           SizedBox(
            height: 20.h,
          ),
          CustomTextFormField(
            onSaved: (val) => Api.me!.email = val ??"Unknown email" ,
            onChange: (date) {
              email = date;
            },
            lableText: AppStrings.lableTextemai,
            prefixIcon: const Icon(Icons.email_outlined),
            inputType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return " please inter email";
              }
            },
          ),
           SizedBox(
            height: 20.h,
          ),
          // Dropdown(),
          // SizedBox(
          //   height: 20.h,
          // ),
          CustomTextFormField(

            lableText: AppStrings.lableTextPassword,
            onChange: (date) {
              password = date;
            },

            inputType: TextInputType.visiblePassword,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
                onPressed: () {

                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                icon: passwordVisible
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined)),
            validator: (value) {
              if (value!.isEmpty) {
                return " please inter password";
              }
            },
            //  controller: TextEditingController(),
          ),
           SizedBox(
            height: 30.h,
          ),
         // state is AppRegisterLoadedState ?
          CustomMaterialBottons(
              backgroundBottonsColors: AppColors.primaryColors,

              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AppRegisterCubit>(context)
                      .userRegister(email: email!, password: password!);
                  onBoardingVisited();
                  User? user = AppRegisterCubit.credential!.user;

                    if (user != null) {
                      await _firestore.collection('users').doc(user.uid).set({
                        'name': userName,
                        'email': email,
                        'image': 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',  // Set default image URL or path here
                      });

                  }
                    return user ;
                  // if(user != null){
                  //   if((await Api.userExist())){
                  //     Navigator.of(context).pushReplacement(
                  //         MaterialPageRoute(builder: (context) => NavigationIcon())
                  //     );
                  //   }else{
                  //     await Api.createUser().then((value) {
                  //       Navigator.of(context).pushReplacement(
                  //           MaterialPageRoute(builder: (context) => NavigationIcon())
                  //       );
                  //     });
                  //   }
                  //
                  // }

                }
              },
              text: AppStrings.signUp),
          SizedBox(
            height: 20.h,
          ),
          const    AddTextDoYouHaveAcountOrNot(),
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
            height: 16.h,
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
