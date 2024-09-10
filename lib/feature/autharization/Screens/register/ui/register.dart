// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_x/feature/autharization/Screens/register/wedget/listener_in_register.dart';
import 'package:home_x/feature/autharization/Screens/register/wedget/register_body_screen.dart';
import 'package:home_x/feature/autharization/date/auth_register/auth_register_cubit.dart';
import 'package:home_x/feature/autharization/date/auth_register/auth_register_state.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppRegisterCubit>(
      create: (context) =>AppRegisterCubit (),
      child: addCubitToRegisterScreen(),
    );
  }

  BlocConsumer<AppRegisterCubit, AppRegisterState> addCubitToRegisterScreen() {
    return BlocConsumer<AppRegisterCubit, AppRegisterState>(
      listener: ListnerInRegister.listenerInRegister,
      builder: (context, state) =>
          RegisterBodyScreen(


          ),
    );
  }
}

