import 'package:bloc/bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeayherCubit extends Cubit<WeatherStates> {
  GetWeayherCubit() : super(IntialState());
  Weather? weather;

  getWeather({required String cityName}) async {
    try {
      weather = await WeatherService().getWeather(cityName: cityName);

      emit(WeatherBodyState(weather: weather!));
    } catch (e) {
      emit(FailureWeatherState());
    }
  }
}
