import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_x/feature/ai/visitor%20name/model.dart';

class VisitorNameService {
  final Dio dio;

  VisitorNameService(this.dio);
  Future<String> getVisitorName() async {
    try {
      Response response = await dio.get(
          'https://face-recognition-api-ixbg.onrender.com/face_recognition');
      NameModel nameModel = NameModel.fromJson(response.data);
      if (nameModel.name.isNotEmpty) {
        return nameModel.name;
      } else {
        return 'No one visited';
      }
    } on Exception catch (e) {
      throw const Text('error!');
    }
  }
}
