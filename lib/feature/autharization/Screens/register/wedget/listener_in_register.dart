import 'package:flutter/material.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/feature/autharization/Screens/lgoin/widgets/show_snack_bar.dart';
import 'package:home_x/feature/autharization/date/auth_register/auth_register_state.dart';

import 'refactor_custom_text_form_field.dart';

class ListnerInRegister {
// static String? user = RefactorCustomTextFormFieldAndAddValidationInRegisterScreen.userName;
  static void listenerInRegister(context, state, {bool isLoaded = false}) {
    if (state is AppRegisterLoadedState) {
      isLoaded = true;
    } else if (state is AppRegisterSuccessState) {
      showSnackBars(context, const Text('Successfully,Check your email to verify your account'),
         const Color(0xEB4FFD23));
      Navigator.pushReplacementNamed(context, Routs.routLoginScreen , ) ;
     
      isLoaded = false;
    } else if (state is AppRegisterErrorState) {
      showSnackBars(
        
        context, const Text('Please check your email and password'), Colors.red);
      isLoaded = false;
    }
  }
}
