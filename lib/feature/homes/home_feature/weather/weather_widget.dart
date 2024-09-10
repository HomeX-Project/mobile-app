import 'package:flutter/material.dart';
import 'package:home_x/core/util/app_assets.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/feature/homes/home_feature/weather/data/weather_model.dart';
import 'package:home_x/feature/homes/home_feature/weather/service/weather_service.dart';
import "package:dio/dio.dart" ;
class Weather extends StatelessWidget {
  Weather({
    Key? key,
    required this.cityName,
  }) : super(key: key);
  String cityName;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherModle>(
      future: WeatherService(Dio()).getCurrentWeather(cityName: cityName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final WeatherModle weatherModel = snapshot.data!;
          weatherModel.image = weatherModel.image?.contains("https:") == false
              ? "https:${weatherModel.image}"
              : weatherModel.image;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.network(weatherModel.image!),
              ),
              Text(
                '${weatherModel.temp}°',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.babyblue,
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return const SizedBox(
            height: 40,
            width: 40,
            child:Text("No Image")   ,  
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
            // Image.asset(Assets.assetsImagesNoWeather),
