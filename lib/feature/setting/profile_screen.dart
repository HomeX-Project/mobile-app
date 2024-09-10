import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_x/core/api/api.dart';
import 'package:home_x/core/helper/helper.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/feature/autharization/Screens/lgoin/ui/login_screen.dart';
import 'package:home_x/feature/autharization/Screens/register/ui/register.dart';
import 'package:home_x/feature/profile/edit_screen.dart';
import 'package:home_x/feature/setting/setting.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/util/app_assets.dart';
import '../../core/modal/user_modal.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({super.key, required this.user });
   ChatUser user ;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final formKey = GlobalKey<FormState>() ;
  String? _image ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop() ;
           // Navigator.push(context, MaterialPageRoute(builder: (_) => Setting())) ;
          },
          icon:const Icon(Icons.arrow_back , size: 24, color: AppColors.primaryColors,),

        ),
        centerTitle: true ,
          title: Text("Profile Screen " , style: StylesApp.font16Madiam.copyWith(fontSize: 20)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: [
                const SizedBox(height: 60,) ,
                Container(
                  height: 190.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: const Color(0xff8593E3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 80,),
                       Text(widget.user.name , style: StylesApp.font20Madiam,),
                      SizedBox(height: 10,),

                      Text(widget.user.email , style: StylesApp.font16Madiam,) ,
                      SizedBox(height: 10,),
                      Text("Ismalia" , style: StylesApp.font20Madiam,),
                    ],

                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    imageUrl: widget.user.image,
                    placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.person),
                  ),
                ),



                Spacer(),
                ////////////////////////////// Button LogOut ////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async{
                        await FirebaseAuth.instance.signOut();
                       await GoogleSignIn().signOut();
                      Dialogs.showProgressBar(context) ;

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=> RegisterScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                  //  backgroundColor: Colors.transparent, // Background color
                    foregroundColor: Color(0xff5E97DA), // Text color
                    side: BorderSide(color: Color(0xff5E97DA)),
                      minimumSize: Size(300, 50)// B ,order color
                  ),
                    child: const Text('Logout' ,style: TextStyle(
                      color: Color(0xff5E97DA),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
              ],
            ),
          ),
          //////////////////////////////////// Handle Image ///////////////////////////////////////////
          _image != null ?
          Positioned(
            top: 30,
            left: 145,
            child: ClipRRect(
              borderRadius:BorderRadius.circular(100),
              child: Image.file(
                File(_image!) ,
                width: 100,
                height: 100,
                fit: BoxFit.fill,

              ),
            ),
          ):
           Positioned(
            top: 30,
              left: 145,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  height: 100,
                    width: 100,
                  fit: BoxFit.cover,
                  imageUrl: widget.user.image,
                  placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.person),
                ),
              ),
          ),
           ///////////////////////// Text Edit /////////////////////////////////////////////
           Positioned(
              top: 90,
              left: 305,
              child: TextButton(onPressed: (){
                print("dara") ;
                bottomModelSheetForEditText();
               // Navigator.push(context, MaterialPageRoute(builder: (_) => EditScreen(
               //   user: Api.me!,
               // ))) ;
              },
                  child:const Text("Edit" , style:TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white
                  )))),
          ///////////////////////// Edit Image /////////////////////////////////////////////
          Positioned(
            top: 80,
            left: 196,
            child: MaterialButton(
              height: 30,
              onPressed: (){
                bottomModelSheetForEditImage() ;
              },
              color: Colors.white,
              shape:const CircleBorder(),
              child:const Icon(Icons.edit, size: 25,color: Color(0xff5E97DA), ),
            ),
          ),
          //const Spacer(),

        ],
      ),
    );
  }

   void bottomModelSheetForEditImage(){
     showModalBottomSheet(
         context: context ,
         shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
         ),
         backgroundColor: Colors.white,
         builder: (_) => ListView(
           shrinkWrap: true,
           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
           children: [
             const Text("Pick you Image" , style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
             ),),
             const SizedBox(height: 20,),
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 ElevatedButton(onPressed: () async {
                   final ImagePicker picker = ImagePicker();
// Pick an image.
                   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                   if(image != null){
                     setState(() {
                       _image = image.path ;

                     });
                     await Api.updateProfilePicture(File(_image!)) ;
                     // Navigator.pop(context) ;
                   }
                 },
                     child: const Text("Pick Image From Gallary")),
                 ElevatedButton(onPressed: ()async{
                   final ImagePicker picker = ImagePicker();
// Pick an image.
                   final XFile? image = await picker.pickImage(source: ImageSource.camera);
                   if(image != null){
                     setState(() {
                       _image = image.path ;

                     });
                     await  Api.updateProfilePicture(File(_image!)) ;
                     setState(() {
                       widget.user.image = _image! ;
                     });
                     await Api.updateUserInfo();
                         Navigator.pop(context) ;
                   }
                 },
                     child: const Text("Pick Image From Camera")),
               ],
             )

           ],
         )
     );
   }
  void bottomModelSheetForEditText(){
    showModalBottomSheet(
        context: context ,

        shape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        backgroundColor: Colors.white,
        builder: (_) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
                //shrinkWrap: true,
                //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [
                  const Text("Edit Your User Information" , style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 20,),
                  Form(
                    key:formKey ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(

                          onSaved: (val) => Api.me!.name = val ??"" ,
                          validator: (val){
                            if(val!.isEmpty){
                              return "required field" ;
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey[50],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                             // borderSide:  BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: const Text("name"),
                          ),
                          initialValue:Api.me!.name ,

                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          initialValue:Api.me!.email ,
                          onSaved: (val) => Api.me!.email = val ??"" ,
                          validator: (val){
                            if(val!.isEmpty){
                              return "required field" ;
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey[50],
                            filled: true,
                            enabledBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: const Text("email"),
                          ),


                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff588DCC),

                          ),
                            onPressed: (){
                              
                              if(formKey.currentState!.validate()){
                                formKey.currentState!.save();
                                Api.updateUserInfo().then((value) =>
                                    Dialogs.showSnakBar(context, "Updated Successfully") ,
                                );
                              }
                              setState(() {

                              });
                            },

                            child:const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Update" , style: TextStyle(
                                  color:  Colors.white,
                                ),),
                              ],
                            )
                        ),
                      ],
                    ),
                  )

                ],
              ),
          )
        );

  }
}

