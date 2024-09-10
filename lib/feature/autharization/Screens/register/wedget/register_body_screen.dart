import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/core/util/app_assets.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/feature/autharization/Screens/register/wedget/refactor_custom_text_form_field.dart';
import 'package:home_x/feature/autharization/Screens/register/wedget/add_text_rigester_title.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'add_text_have_acount_or_not.dart';

class RegisterBodyScreen extends StatelessWidget {
   RegisterBodyScreen({
    super.key,

  });

  final bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(

        backgroundColor: AppColors.authBackground,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                  height: 40.h,
                ),
                Center(child: Image.asset(Assets.assetsImagesAppIcon)),
                const Center(child:  AddTextRegisterTitle()),
                RefactorCustomTextFormFieldAndAddValidationInRegisterScreen(

                ),

           // SizedBox(height: 20.h,),
           //      Container(
           //          alignment: Alignment.center,
           //          margin: const EdgeInsets.symmetric(horizontal: 20),
           //          child: Image.asset(
           //            Assets.assetsImagesGoogle,
           //
           //            height: 100.h,
           //            width: 100.w,
           //          )),
                   
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
