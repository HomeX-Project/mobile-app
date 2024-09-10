import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_x/feature/ai/visitor%20name/service.dart';

class NameText extends StatelessWidget {
  const NameText( {Key? key, required this.textStyle}) : super(key: key);
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: VisitorNameService(Dio()).getVisitorName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          String visitorName = snapshot.data ?? '';
          print(visitorName);
          return Text(
            visitorName,
            style: textStyle,
          );
        }
      },
    );
  }
}
