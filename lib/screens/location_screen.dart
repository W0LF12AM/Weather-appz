// print(temperature);
// print(condition);
// print(cityName);

import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double? temperature;
  int? condition;
  String? cityName;
  String? weatherEmoji;
  String? weatherMessage;

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
    print(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherEmoji = 'Error :3';
        weatherMessage = 'can\'t get the weather data';
        cityName = ' ';
        return;
      }

      temperature = weatherData['main']['temp'];
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherEmoji = weather.getWeatherEmoji(condition!);
      weatherMessage = weather.getTemperatureMessage(temperature!, cityName!);
    });

    print(temperature);
    print(condition);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${temperature!.toInt()}°C',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              '$condition',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              weatherEmoji!,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              '$cityName',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              weatherMessage!,
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
