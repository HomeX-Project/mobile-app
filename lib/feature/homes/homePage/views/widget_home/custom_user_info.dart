import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/core/api/api.dart';
// import 'package:home_x/core/util/styles.dart';
// import 'package:home_x/core/modal/user_modal.dart';
// import 'package:home_x/feature/homes/weather/weather_widget.dart';
//
// class CustomUserInfo extends StatefulWidget {
//   CustomUserInfo({super.key });
//   Future<ChatUser?>? futureUser;
//   @override
//   State<CustomUserInfo> createState() => _CustomUserInfoState();
// }
//
// class _CustomUserInfoState extends State<CustomUserInfo> {
//
//
//   @override
//   void initState() {
//     super.initState();
//     widget.futureUser = Api.getSetInfo() ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ChatUser?>(
//       future: widget.futureUser ,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data == null) {
//           return Center(child: Text('User data not available'));
//         } else {
//           ChatUser user = snapshot.data!;
//           return Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Hello",
//                     style: StylesApp.font16Madiam.copyWith(
//                         color: const Color(0xff5E97DA), fontSize: 22),
//                   ),
//                   Text(
//                     user.name,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: StylesApp.font20Madiam.copyWith(
//                       color: const Color(0xff5E97DA),
//                       fontSize: 22.sp,
//                     ),
//                   ),
//                 ],
//               ),
//
//               Weather(cityName: '',) ,
//               const Spacer(),
//               Image.asset("assets/images/app_icon.png"),
//               // If you want to use CachedNetworkImage for profile picture
//               // ClipRRect(
//               //   borderRadius: BorderRadius.circular(40),
//               //   child: CachedNetworkImage(
//               //     height: 50,
//               //     width: 50,
//               //     fit: BoxFit.fill,
//               //     imageUrl: user.image,
//               //     placeholder: (context, url) =>
//               //         const CircularProgressIndicator(),
//               //     errorWidget: (context, url, error) => const Icon(Icons.person),
//               //   ),
//               // ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_x/core/api/api.dart';
import 'package:home_x/core/util/styles.dart';
import 'package:home_x/feature/autharization/Screens/register/wedget/refactor_custom_text_form_field.dart';
import 'package:home_x/core/modal/user_modal.dart';

class CustomUserInfo extends StatefulWidget {
  CustomUserInfo({
    super.key,
    // required this.user ,
  });
  // ChatUser user ;
  @override
  State<CustomUserInfo> createState() => _CustomUserInfoState();
}

class _CustomUserInfoState extends State<CustomUserInfo> {
  // String? user = RefactorCustomTextFormFieldAndAddValidationInRegisterScreen.userName ;
  void initState(){
    Api.getSetInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Hello",
                style: StylesApp.font16Madiam
                    .copyWith(color: const Color(0xff5E97DA), fontSize: 22)),
            Text(
              //  widget.user.name,
              'mai',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: StylesApp.font20Madiam.copyWith(
                color: const Color(0xff5E97DA),
                fontSize: 22.sp,
              ),
            ),

          ],
        ),
        const Spacer(),
       Image.asset("assets/images/app_icon.png"),
       
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(40),
        //   child: CachedNetworkImage(
        //     height: 80,
        //     width: 80,
        //     fit: BoxFit.fill,
        //     imageUrl: widget.user.image ,
        //     placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
        //     errorWidget: (context, url, error) => const Icon(Icons.person),
        //   ),
        // ),

      ],
    );
  }
}