class WeatherModle {
  final String cityName;
  String? image;
  final double temp;

  WeatherModle(
      {required this.cityName,
      required this.image,
      required this.temp,});
  factory WeatherModle.fromJson(json) {
    return WeatherModle(
      cityName: json['location']['name'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
    );
  }
}
