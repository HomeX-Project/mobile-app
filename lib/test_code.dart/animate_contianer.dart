// import 'package:flutter/material.dart';
// import 'package:home_x/core/util/app_assets.dart';

// class ContianerAnimate extends StatefulWidget {
//   ContianerAnimate({super.key});

//   @override
//   State<ContianerAnimate> createState() => _ContianerAnimateState();
// }

// class _ContianerAnimateState extends State<ContianerAnimate> {
//   double height = 200;

//   double width = 200;
//   Widget? image = Image.asset("assets/images/ActiveWavesBlue.png");  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Animate Contianer"),
//         ),
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: AnimatedContainer(
//                   duration: Duration(seconds: 10),
//                   width: height,
//                   height: width,
//                   decoration: BoxDecoration(
//                     // color: Colors.red,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(child: image),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blue),
//                   child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           // height = 300;
//                           // width = 300;
//                          // image = Image.asset(Assets.assetsImagesActiveWavesPurple);
//                         });
//                       },
//                       child: Text("Animate Contianer")))
//             ]));
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Animate Contianer"),
//         ),
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: AnimatedContainer(
//                   duration: Duration(seconds: 10),
//                   width: height,
//                   height: width,
//                   decoration: BoxDecoration(
//                     // color: Colors.red,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(child: image),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blue),
//                   child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           // height = 300;
//                           // width = 300;
//                           image = Image.asset(Assets.assetsImagesActiveWavesPurple);
//                         });
//                       },
//                       child: Text("Animate Contianer")))
//             ]));
//   }
// }
