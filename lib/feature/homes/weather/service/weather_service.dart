import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_x/feature/homes/weather/data/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
// http://api.weatherapi.com/v1/forecast.json?key=c9b78bcb02654430b9b180345232311&q=egypt
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'c9b78bcb02654430b9b180345232311';
  Future<WeatherModle> getCurrentWeather({required String cityName}) async {
    try {
  Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
    WeatherModle weatherModle = WeatherModle.fromJson(response.data);
    return weatherModle;
} on Exception catch (e) {
  throw const Text('error!') ;
}
  }
}
