// import 'dart:async';
// import 'dart:developer' as developer;

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:home_x/core/routing/const_routs.dart';

// class Home extends StatefulWidget {
//   Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];

//   final Connectivity _connectivity = Connectivity();

//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

//   @override
//   void initState() {
//     super.initState();
//     initConnectivity();

//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   @override
//   // void dispose() {
//   //   _connectivitySubscription.cancel();
//   //   super.dispose();
//   // }

//   Future<void> initConnectivity() async {
//     late List<ConnectivityResult> result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       developer.log('Couldn\'t check connectivity status', error: e);
//       return;
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) {
//       return Future.value(null);
//     }

//     return _updateConnectionStatus(result);
//   }

//   Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
//     setState(() {
//       _connectionStatus = result;
//     });
//   }

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       // backgroundColor: Colors.amberAccent,
//       body: 
//       Center(
//         child: _buildContent(),
//       ),
//     );
//   }

//   Widget _buildContent() {
//     if (_connectionStatus.contains(ConnectivityResult.mobile) ||
//         _connectionStatus.contains(ConnectivityResult.wifi)) {
//       // Connected to either mobile data or WiFi, show the log out button
//       return MaterialButton(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         onPressed: () async {
//           //await FirebaseAuth.instance.signOut();
//           // mohamedhusseinmans@gmail.com
//           //  Navigator.popAndPushNamed(context, Routs.routLoginScreen);
//         },
//         child: const Text(
//           "Log Out",
//           style: TextStyle(color: Colors.black),
//         ),
//       );
//     } else {
//       // Not connected, show a message indicating no connection
//       return const Text(
//         "No Internet Connection",
//         style: TextStyle(color: Colors.white),
//       );
//     }
//   }
// }




// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Test'),
//       ),
//       body: Container(
//   // decoration: BoxDecoration(
//   //   image: DecorationImage(
//   //     image: SvgPicture.asset(
//   //       'assets/images/Vector.svg',
//   //       width: 100, // Adjust the width and height as needed
//   //       height: 100,
//   //     ) as ImageProvider, // Use the image property of SvgPicture.asset
//   //     fit: BoxFit.cover,
//   //   ),
//   // ),
// ),

      
//     );
//   }
// }