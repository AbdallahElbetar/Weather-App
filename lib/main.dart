import 'package:flutter/material.dart';
import 'package:weather_app/cubits/weather_cubit/get_weayher_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeayherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeayherCubit, WeatherStates>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  getColorTheme(BlocProvider.of<GetWeayherCubit>(context)
                      .weather
                      ?.statuWeather)[400]!,
                  Colors.white,
                  getColorTheme(BlocProvider.of<GetWeayherCubit>(context)
                          .weather
                          ?.statuWeather ??
                      null)[400]!,
                ],
              )),
              child: MaterialApp(
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.transparent,
                  colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: getColorTheme(
                        BlocProvider.of<GetWeayherCubit>(context)
                                .weather
                                ?.statuWeather ??
                            null),
                  ),
                  appBarTheme: AppBarTheme(
                    color: getColorTheme(
                        BlocProvider.of<GetWeayherCubit>(context)
                                .weather
                                ?.statuWeather ??
                            null),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomePage(),
              ),
            );
          },
        ),
      ),
    );
  }

  MaterialColor getColorTheme(String? condition) {
    if (condition == null) return Colors.blueGrey;

    if (condition == "Sunny") {
      return Colors.orange; // Bright sunny color
    } else if (condition == "Partly cloudy") {
      return Colors.blueGrey; // Partly cloudy color
    } else if (condition == "Cloudy") {
      return Colors.grey; // Cloudy color
    } else if (condition == "Overcast") {
      return Colors.blueGrey; // Darker cloudy color
    } else if (condition == "Mist") {
      return Colors.blue; // Misty color
    } else if (condition == "Patchy rain possible" ||
        condition == "Light rain") {
      return Colors.lightBlue; // Light rain color
    } else if (condition == "Heavy rain") {
      return Colors.blue; // Heavy rain color
    } else if (condition == "Patchy snow possible" ||
        condition == "Patchy light snow") {
      return Colors.cyan; // Snowy color
    } else if (condition == "Thundery outbreaks possible") {
      return Colors.orange; // Thunderstorm color
    } else {
      return Colors.grey; // Default color for unknown conditions
    }
  }
}
