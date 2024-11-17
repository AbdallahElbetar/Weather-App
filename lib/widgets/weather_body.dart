import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/get_weayher_cubit.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weather = BlocProvider.of<GetWeayherCubit>(context).weather!;
    // take object from blocprovider
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          weather.cityName,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "updated at ${weather.lastUpdated.substring(weather.lastUpdated.length - 5, weather.lastUpdated.length)}",
          style: const TextStyle(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https:${weather.image}",
                width: 100,
                // height: double.minPositive,
                //width: 64, // Adjust as needed
                height: 100,

                errorBuilder: (context, error, stackTrace) {
                  // Handle loading errors (e.g., show a placeholder icon)
                  return Icon(Icons.error_outline);
                },
              ),
              Text(
                "${weather.temp.round()}",
                style: const TextStyle(fontSize: 40),
              ),
              Text(
                "Max temp ${weather.maxTemp.round()}  \n Min temp ${weather.minTemp.round()}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Text(
          weather.statuWeather,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
  }
}
