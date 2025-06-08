import 'package:geolocator/geolocator.dart';

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.low,
  distanceFilter: 100,
);

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Future<void> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah layanan lokasi nyala
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Layanan lokasi mati. Harap aktifkan di pengaturan.');
      return;
    }

    // Cek permission
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Permission lokasi ditolak.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Permission ditolak permanen. Harap ubah di pengaturan.');
      return;
    }

    // Kalau sudah dapat izin
    print('Permission granted!');
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
