// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:home_x/core/api/api.dart';
// import 'package:home_x/core/helper/helper.dart';
// import 'package:home_x/feature/homes/icon_navigation/icon_navigate.dart';
// import 'package:home_x/modal/user_modal.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'package:flutter/material.dart';
//
// class EditScreen extends StatefulWidget {
//   EditScreen(
//       {super.key,  required this.user,} );
//   ChatUser user ;
//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }
//
// class _EditScreenState extends State<EditScreen> {
//   String? _image ;
//   final formKey = GlobalKey<FormState>() ;
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor:  const Color(0xff8593E3),
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: (){
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (_) => NavigationIcon()));
//           },
//           icon:const  Icon(Icons.close,size: 30,color: Colors.black,),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: GestureDetector(
//             onTap: () => FocusScope.of(context).unfocus(),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   const SizedBox(height:50),
//                   _image != null ?
//                   ClipRRect(
//                     borderRadius:BorderRadius.circular(100),
//                     child: Image.file(
//                       File(_image!) ,
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.fill,
//
//                     ),
//                   )
//                       : ClipRRect(
//                     borderRadius:BorderRadius.circular(50),
//                     child: CachedNetworkImage(
//                       height: 50,
//                       width: 50,
//                       fit: BoxFit.fill,
//                       imageUrl: widget.user.image ?? "" ,
//                       placeholder: (context, url) => const CircularProgressIndicator(),
//                       errorWidget: (context, url, error) => const Icon(Icons.person),
//                     ),
//                   ),
//                   const SizedBox(height: 30,),
//                   ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(Colors.grey[50],),
//                       ),
//                       onPressed: (){
//                         bottomModelSheet() ;
//                       },
//                       child: const Text("Edit")) ,
//                   Text(widget.user.name) ,
//                   Text(widget.user.email) ,
//                   CachedNetworkImage(
//                     height: 50,
//                     width: 50,
//                     fit: BoxFit.fill,
//                     imageUrl: widget.user.image ?? "" ,
//                     placeholder: (context, url) => const CircularProgressIndicator(),
//                     errorWidget: (context, url, error) => const Icon(Icons.person),
//                   ),
//
//                   const SizedBox(height: 30,),
//                   TextFormField(
//                     onSaved: (val) => Api.me!.name = val ??"" ,
//                     validator: (val){
//                       if(val!.isEmpty){
//                         return "required field" ;
//                       }
//                     },
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       fillColor: Colors.grey[50],
//                       filled: true,
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:  BorderSide.none,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       label: const Text("name"),
//                     ),
//
//
//                   ),
//                   const SizedBox(height: 30,),
//
//                   TextFormField(
//                     onSaved: (val) => Api.me!.email = val ??"" ,
//                     validator: (val){
//                       if(val!.isEmpty){
//                         return "required field" ;
//                       }
//                     },
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       fillColor: Colors.grey[50],
//                       filled: true,
//                       enabledBorder: OutlineInputBorder(
//
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       label: const Text("email"),
//                     ),
//
//
//                   ),
//                   const SizedBox(height: 30,),
//                   ElevatedButton(
//                       onPressed: (){
//                         if(formKey.currentState!.validate()){
//                           formKey.currentState!.save();
//                           Api.updateUserInfo().then((value) =>
//                               Dialogs.showSnakBar(context, "Updated Successfully") ,
//                           );
//                         }
//                       },
//
//                       child:const Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.edit),
//                           SizedBox(width: 20,),
//                           Text("Update"),
//                         ],
//                       )
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void bottomModelSheet(){
//     showModalBottomSheet(
//         context: context ,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
//         ),
//         backgroundColor: Colors.white,
//         builder: (_) => ListView(
//           shrinkWrap: true,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           children: [
//             const Text("Pick you Image" , style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold
//             ),),
//             const SizedBox(height: 20,),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(onPressed: () async {
//                   final ImagePicker picker = ImagePicker();
// // Pick an image.
//                   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//                   if(image != null){
//                     setState(() {
//                       _image = image.path ;
//
//                     });
//                     await Api.updateProfilePicture(File(_image!)) ;
//                     // Navigator.pop(context) ;
//                   }
//                 },
//                     child: const Text("Pick Image From Gallary")),
//                 ElevatedButton(onPressed: ()async{
//                   final ImagePicker picker = ImagePicker();
// // Pick an image.
//                   final XFile? image = await picker.pickImage(source: ImageSource.camera);
//                   if(image != null){
//                     setState(() {
//                       _image = image.path ;
//
//                     });
//                     await  Api.updateProfilePicture(File(_image!)) ;
//                     //     Navigator.pop(context) ;
//                   }
//                 },
//                     child: const Text("Pick Image From Camera")),
//               ],
//             )
//
//           ],
//         )
//     );
//   }
// }
