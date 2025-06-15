// print(temperature);
// print(condition);
// print(cityName);

// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constatnts.dart';
import 'package:clima/utilities/icon_and_number_wdiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double? temperature;
  int? humidity;
  int? pressure;
  int? condition;
  String? cityName;
  String? weatherEmoji;
  String? weatherMessage;
  String? description;

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
      humidity = weatherData['main']['humidity'];
      pressure = weatherData['main']['pressure'];
      description = weatherData['weather'][0]['description'];
      weatherEmoji = weather.getWeatherEmoji(condition!);
      weatherMessage = weather.getTemperatureMessage(temperature!, cityName!);
    });

    print(temperature);
    print(humidity);
    print(pressure);
    print(condition);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  decoration: TexfieldInputDecoration,
                  // onChanged: (value) {
                  //   cityName = value;
                  // },
                  onSubmitted: (value) async {
                    cityName = value;
                    var weatherData =
                        await WeatherModel().getCityWeatherByName(cityName!);
                    updateUi(weatherData);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  decoration: BoxDecoration(
                      gradient:
                          RadialGradient(colors: nightGradient, radius: 3),
                      borderRadius: BorderRadius.circular(20)),

                  //INSIDE CONTAINER//---------------------------------------------------------------

                  child: Column(
                    children: [
                      Text(
                        '$cityName',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: h2),
                      ),
                      // Text(
                      //   '$condition',
                      //   style: GoogleFonts.poppins(color: Colors.white),
                      // ),
                      Lottie.asset(
                        weatherEmoji!,
                      ),
                      Text('$description',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: h3)),

                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconAndNumberWdiget(
                                icons: Icons.water_drop_outlined,
                                numbers: humidity),
                            IconAndNumberWdiget(
                                icons: Icons.thermostat,
                                numbers: '${temperature!.toInt()}°C'),
                            IconAndNumberWdiget(
                                icons: Icons.speed, numbers: pressure!)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          weatherMessage!,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: h4),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FloatingActionButton(
              //   heroTag: 'refresh Button',
              //   onPressed: () async {
              //     var weatherData = await WeatherModel().getLocation();
              //     updateUi(weatherData);
              //   },
              //   child: Icon(Icons.refresh),
              // ),
              // SizedBox(
              //   width: 20,
              // ),
              FloatingActionButton(
                heroTag: 'Go to home button',
                onPressed: () async {
                  var typedName = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CityScreen();
                    }),
                  );
                  if (typedName != null) {
                    var weatherData =
                        await weather.getCityWeatherByName(typedName);
                    updateUi(weatherData);
                  }
                },
                child: Icon(Icons.home_max_rounded),
              ),
            ],
          )
        ],
      ),
    );
  }
}
