import 'package:weather_app/models/weather.dart';

class WeatherStates {}

class WeatherBodyState extends WeatherStates {
  final Weather weather;
  WeatherBodyState({required this.weather});
}

class IntialState extends WeatherStates {}

class FailureWeatherState extends WeatherStates {}
