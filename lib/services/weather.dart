import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  String apiKey = 'b0b3541d1f66e99621205eba9b69be8d';
  String openWeatherURL = 'http://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getCityWeatherByName(String cityName) async {
    var url = '$openWeatherURL?q=$cityName&appid=$apiKey&units=metric';

    Networking networking = Networking(url: url);

    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> getLocation() async {
    double? latitude;
    double? longitude;

    Location location = Location();

    await location.handleLocationPermission();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    Networking networking = Networking(
        url:
            '$openWeatherURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networking.getData();

    print('Data berhasil terkirim');
    return weatherData;
  }

  String getWeatherEmoji(int conditionId) {
    if (conditionId >= 200 && conditionId < 300) {
      return 'assets/thunder.json'; // Thunderstorm
    } else if (conditionId >= 300 && conditionId < 400) {
      return 'assets/drizzle.json'; // Drizzle
    } else if (conditionId >= 500 && conditionId < 600) {
      return 'assets/thunder.json'; // Rain
    } else if (conditionId >= 600 && conditionId < 700) {
      return 'assets/snow.json'; // Snow
    } else if (conditionId >= 700 && conditionId < 800) {
      return 'assets/mist.json'; // Atmosphere (mist, fog, smoke, etc.)
    } else if (conditionId == 800) {
      return 'assets/sun.json'; // Clear
    } else if (conditionId > 800 && conditionId <= 804) {
      return 'assets/cloudy sun.json'; // Clouds
    } else {
      return 'assets/default.json'; // Default / unknown
    }
  }

  String getTemperatureMessage(double temperature, String cityName) {
    if (temperature < 5) {
      return 'Dingin banget di ${cityName}, jangan lupa pakai jaket!';
    } else if (temperature >= 5 && temperature < 15) {
      return 'Udah mulai dingin nih di ${cityName}, bawa jaket ya.';
    } else if (temperature >= 15 && temperature < 25) {
      return 'Cuaca sejuk, pas buat jalan-jalan di ${cityName}!';
    } else if (temperature >= 25 && temperature < 32) {
      return 'Di ${cityName} lumayan panas, banyakin minum air putih ya.';
    } else {
      return 'Panas banget cuy di ${cityName}! Hindari keluar siang-siang.';
    }
  }
}
