import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_x/core/modal/user_modal.dart';
import "package:firebase_storage/firebase_storage.dart" ;
import 'package:cloud_firestore/cloud_firestore.dart';
class Api{
  static FirebaseAuth auth  = FirebaseAuth.instance ;
  static  FirebaseFirestore fireStore = FirebaseFirestore.instance ;
  static FirebaseStorage storage  =FirebaseStorage.instance ;
  static User get user => auth.currentUser! ;
  static   ChatUser?  me  ;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<bool> userExist()async{
    // ChatUser user ;
    return (await fireStore.collection("users").doc(user.uid).get()).exists ;

  }



  static Future<ChatUser?> getSetInfo()async{
    // ChatUser user ;
    await fireStore.collection("users").doc(user.uid).get().then((user) async{
      if(user.exists){
        me = ChatUser.fromJson(user.data()!) ;
        print("Data is $me") ;
      }else{
        await createUser().then((value) => getSetInfo());
      }
    });

  }
  static Future<void> createUser()async{
    final time = DateTime.now().millisecondsSinceEpoch.toString() ;
    ChatUser chatUser = ChatUser(
        image: user.photoURL.toString() ,
        name: user.displayName.toString(),
        id: user.uid,
        email: user.email.toString()
    ) ;
    return await fireStore.collection("users").doc(user.uid).set(chatUser.toJson()) ;

  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUser(){
    return fireStore.collection("users").where("id" , isEqualTo: user.uid).snapshots();
  }
  static Future<void> updateUserInfo()async{
    // ChatUser user ;
    await fireStore.collection("users").doc(user.uid).update({
      "name" :Api.me!.name,
      "email" :Api.me!.email,
      "image" : Api.me!.image ,
    });

  }

  static Future<void> updateProfilePicture(File file)async{
    final ext = file.path.split(".").last ;
    final ref =  storage.ref().child("Profile_picture/${user.uid}.$ext") ;

    await ref.putFile(file , SettableMetadata(contentType: "image/$ext")).then((p0) {
      print("Date transfared : ${p0.bytesTransferred /1000 } kb");
    }) ;

    me!.image =await  ref.getDownloadURL() ;
    await  fireStore.collection("users").doc(user.uid).update({"image" : me!.image}) ;


  }
}


