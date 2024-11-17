import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/get_weayher_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        title: const Text(
          "Search a City",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: TextField(
            onSubmitted: (value) async {
              await BlocProvider.of<GetWeayherCubit>(context)
                  .getWeather(cityName: value);
              FocusScope.of(context).isFirstFocus;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              labelText: "Search",
              labelStyle:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              hintText: "Enter City Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
