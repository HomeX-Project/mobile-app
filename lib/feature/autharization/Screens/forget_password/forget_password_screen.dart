import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/feature/autharization/Screens/forget_password/widget/forget_password_body.dart';
import 'package:home_x/feature/autharization/Screens/lgoin/widgets/show_snack_bar.dart';
import 'package:home_x/feature/autharization/date/auth_forget_password/auth_cubit.dart';
import 'package:home_x/feature/autharization/date/auth_forget_password/auth_state.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppForgetPasswordCubit, AppForgetPasswordState>(
      listener: (context, state) {
        if (state is AppSuccessForgetPasswordState) {
          showSnackBars(context,
              const Text("Check Your Email To Reset Password"), Colors.green);
          Navigator.pushNamed(context, Routs.routLoginScreen);
        } else if (state is AppErrorForgetPasswordState) {
          showSnackBars(context, Text("Check your email"), Colors.red);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor:AppColors.authBackground,
          body: ForgetPasswordBodyScreen(),
        );
      },
    );
  }
}
