import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_x/core/routing/const_routs.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/feature/autharization/date/auth_login/auth_cubit.dart';
import 'package:home_x/feature/autharization/date/auth_login/auth_state.dart';
import 'package:home_x/feature/autharization/Screens/lgoin/widgets/login_body_screen.dart';
import 'package:home_x/feature/autharization/Screens/lgoin/widgets/show_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RegExp regexCapital = RegExp(r'^(?=.*?[A-Z])');
  RegExp regexSmall = RegExp(r'^(?=.*?[a-z])');
  RegExp regexNumber = RegExp(r'^(?=.*?[0-9])');
  String? email;
  String? password;
  bool isloaded = false;
  // final _authCubit = AppLoginCubit();
  // void dispose(){
  //   if(!_authCubit.isClosed) _authCubit.close();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginState>(
      listener: (context, state) async {
        if (state is AppLoginLoadingState) {
          isloaded = true;
          // setState(() {
          //
          // });
        } else if (state is AppLoginSuccessState) {
          isloaded = false;
          // setState(() {
          //
          // });
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            await Navigator.of(context).pushNamedAndRemoveUntil(
              Routs.routIconNavigation,
                  (route) => false,
            );
          } else {
            showSnackBars(
              context,
              const Text('please check your email to verify account'),
              const Color.fromRGBO(244, 67, 54, 1),
            );
          }
        } else if (state is AppLoginErrorState) {
          isloaded = false;
          // setState(() {
          //
          // });
          showSnackBars(
            context,
            const Text("Please check your email and password"),
            Colors.red,
          );
        } else {
          isloaded = false;
          // setState(() {
          //
          // });
          showSnackBars(
            context,
            const Text("Please check your email and password"),
            Colors.red,
          );
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isloaded,
        child: Scaffold(
          backgroundColor: AppColors.authBackground,
          body: SingleChildScrollView(
            child: Column(
              children: [
                LoginBodyScreen(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
