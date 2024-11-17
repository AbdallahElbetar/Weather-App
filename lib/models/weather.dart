class Weather {
  final String cityName;
  final String lastUpdated;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String statuWeather;

  Weather(
      {required this.cityName,
      required this.lastUpdated,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.statuWeather});

  factory Weather.fromJson(Map<String, dynamic> jsonData) {
    return Weather(
        cityName: jsonData["location"]["name"],
        lastUpdated: jsonData["current"]["last_updated"],
        image: jsonData["forecast"]["forecastday"][0]["day"]["condition"]
            ["icon"],
        statuWeather: jsonData["forecast"]["forecastday"][0]["day"]["condition"]
            ["text"],
        temp: jsonData["current"]["temp_c"],
        maxTemp: jsonData["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: jsonData["forecast"]["forecastday"][0]["day"]["mintemp_c"]);
  }
}
