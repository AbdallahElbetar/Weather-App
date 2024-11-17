import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "There is No Weather 😔 Start \n        Searching Now 🔍 ",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
