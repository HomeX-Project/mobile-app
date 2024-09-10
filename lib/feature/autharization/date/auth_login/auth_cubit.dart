// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:home_x/feature/autharization/date/auth_login/auth_state.dart';
//
// class AppLoginCubit extends Cubit<AppLoginState> {
//   AppLoginCubit() : super(AppLoginInatialState());
//
//   Future<void> userLogin({required String email, required String password}) async {
//     if (isClosed) return; // Check if the cubit is already closed
//     emit(AppLoginLoadingState());
//     try {
//       UserCredential credential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       if (!isClosed) emit(AppLoginSuccessState());
//     } catch (e) {
//       if (!isClosed) emit(AppLoginErrorState());
//     }
//   }
//
// // IconData suffix = Icons.visibility_outlined;
// // bool passwordVisible = true;
// // dynamic chanageModePassword() {
// //   if (passwordVisible == true) {
// //     passwordVisible = !passwordVisible;
// //     print(passwordVisible);
// //   } else {
// //     passwordVisible = true;
// //   }
// //   emit(ChangeModePassword());
// // }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_x/feature/autharization/date/auth_login/auth_state.dart';
class AppLoginCubit extends Cubit<AppLoginState> {
  AppLoginCubit() : super(AppLoginInatialState());

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(AppLoginLoadingState());
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AppLoginSuccessState());
    }  catch (e) {
      emit(AppLoginErrorState());
    }
  }
}