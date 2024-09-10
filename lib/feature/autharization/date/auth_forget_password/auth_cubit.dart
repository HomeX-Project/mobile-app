import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_x/feature/autharization/date/auth_forget_password/auth_state.dart';

class AppForgetPasswordCubit extends Cubit<AppForgetPasswordState> {
  AppForgetPasswordCubit() : super(InitialState());
  resetPasswordLink({required String email}) async {
    try {
      emit(LoadedState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(AppSuccessForgetPasswordState());
    } catch (e) {
      print(e.toString());
      emit(AppErrorForgetPasswordState(
        // error: e.toString(),
      ));
    }
  }
}
