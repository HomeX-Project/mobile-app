// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:home_x/feature/homes/home_feature/bathroom/bathroom.dart';
// import 'package:home_x/feature/homes/home_feature/bedRoom/bed_lighing_container.dart';
// import 'package:home_x/feature/homes/home_feature/Offic/OfficLighitng.dart';
// import 'package:home_x/feature/homes/home_feature/kitchen/ketchen.dart';
// import 'package:home_x/feature/homes/home_feature/reception/reception.dart';

// import 'package:home_x/feature/homes/homePage/views/widget_home/section_home_info.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF1F6FB),
//       body: ListView(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SectionHomeInformation(),
//               const SizedBox(
//                 height: 25,
//               ),
//               const SectionHomeListAndPageView(),
//               const SizedBox(height: 110),
//               Container(
//                 height: 100,
//                 color: Colors.grey[200],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SectionHomeListAndPageView extends StatefulWidget {
//   const SectionHomeListAndPageView({super.key});

//   @override
//   State<SectionHomeListAndPageView> createState() =>
//       _SectionHomeListAndPageViewState();
// }

// class _SectionHomeListAndPageViewState
//     extends State<SectionHomeListAndPageView> {
//   int _selectedIndex = 0;
//   List<Widget> screens = [
//     const Reception(),
//     OfficLightContainer(),
//     BedLightContainer(),
//     Ketchen(),
//     const BathRoom(),
//   ];
//   List<String> list = [
//     "reseptions",
//     "Office",
//     "bedroom",
//     "Kitchen",
//     "bathroom",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 60.h,
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             color: Colors.green, // backgroundColor of list view
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               bottomLeft: Radius.circular(20),
//             ),
//           ),
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: list.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     // _selectedIndex = index;
//                   });
//                 },
//                 child: Container(
//                   height: 30.h,
//                   width: 100.h,
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.green.shade50,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Text(
//                     list[index],
//                     style: TextStyle(
//                         fontSize: _selectedIndex == index ? 20.sp : 15.sp,
//                         fontWeight: FontWeight.w600,
//                         color: _selectedIndex == index
//                             ? const Color(0xff7885FF)
//                             : const Color.fromARGB(255, 136, 179, 231)),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         // BuildTextListView(),
//         SizedBox(
//           height: 300,
//           child: PageView.builder(
//             itemCount: screens.length,
//             controller: PageController(initialPage: _selectedIndex),
//             onPageChanged: (index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             itemBuilder: (context, index) {
//               return screens[index];
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

