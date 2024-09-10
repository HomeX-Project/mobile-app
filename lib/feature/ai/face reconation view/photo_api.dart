import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_x/core/util/app_assets.dart';
import 'package:home_x/feature/ai/lifestream/web_view.dart';
import 'package:home_x/feature/ai/visitor%20name/service.dart';
import 'package:home_x/feature/homes/home_feature/notifications/notifications.dart';
import 'package:dio/dio.dart';

class ApiPhoto extends StatefulWidget {
  const ApiPhoto({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<ApiPhoto> createState() => _ApiPhotoState();
}

class _ApiPhotoState extends State<ApiPhoto> {
  final DatabaseReference _gasRef =
      FirebaseDatabase.instance.ref().child('esp1/ultrasonic');
  int ultrasonic = 0;
  // final Dio _dio = Dio();
  final VisitorNameService _visitorNameService = VisitorNameService(Dio());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
      stream: _gasRef.onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData) {
          final Map data = snapshot.data?.snapshot.value as Map;
          print(data);
          ultrasonic = data['state'];
          print(ultrasonic);
          if (ultrasonic == 1) {
            _sendVisitorNotification();
          }
          return SizedBox(
            height: 500,
            width: double.infinity,
            child: ultrasonic == 0
                ? Image.asset(Assets.assetsImagesAvatar)
                : Webview(
                    url: widget.url,
                  ),
          );
          print(ultrasonic);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Text('Loading...');
        }
      },
    );
  }

  void _sendVisitorNotification() async {
    try {
      String visitorName = await _visitorNameService.getVisitorName();
      if (visitorName.isNotEmpty && visitorName != 'No one visited') {
        print('Buzzer is active, sending notification');
        LocalNotification.basicNotification(
            'Visitor🧍🏻', 'Visitor: $visitorName. Click here to see who!', '');
      }
    } catch (e) {
      print('Failed to get visitor name: $e');
    }
  }
}
