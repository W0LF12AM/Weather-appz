// print(temperature);
// print(condition);
// print(cityName);

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

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
    print(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      temperature = weatherData['main']['temp'];
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
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
              '$cityName',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
