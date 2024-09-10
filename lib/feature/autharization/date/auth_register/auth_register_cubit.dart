import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_x/feature/autharization/date/auth_register/auth_register_state.dart';

class AppRegisterCubit extends Cubit<AppRegisterState> {
  AppRegisterCubit() : super(AppInitialState());
  static UserCredential? credential ;
  bool? obscurePasswordTextValue = true;
  String? name;
  String? email;
  String? image ;
  Future<void> userRegister(
      {required String email, required String password}) async {
    emit(AppRegisterLoadedState());
    try {
      // ignore: unused_local_variable
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addUserProfile() ;
      emailVerify();
      emit(AppRegisterSuccessState());
    } catch (e) {
      emit(AppRegisterErrorState());
    }
  }

  Future<void> emailVerify() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }
  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "email": email,
      "name":name ,
      "image": image ?? 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',  // Set default image URL or path here

    });
  }
  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }
}
