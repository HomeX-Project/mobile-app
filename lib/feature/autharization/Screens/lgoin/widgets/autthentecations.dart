 import 'package:firebase_auth/firebase_auth.dart';

Future<void> userLogin(String? email , password) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email!, password: password!);
  }

 Future<void> userRegister(String? email , password) async{
   UserCredential credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }