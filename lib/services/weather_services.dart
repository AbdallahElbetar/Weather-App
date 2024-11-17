import 'package:dio/dio.dart';

import 'package:weather_app/models/weather.dart';

class WeatherService {
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "88b40c24789b4b77bef182305242109";
  Dio dio = Dio();
  Future<Weather> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("${baseUrl}/forecast.json?key=${apiKey}&q=${cityName}&days=1");

      Weather weather = Weather.fromJson(response.data);
      return weather;
    } on DioException catch (e) {
      final String erorrMessage =
          e.response?.data["error"]["message"] ?? "Oops Try Later";
      throw Exception(erorrMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
