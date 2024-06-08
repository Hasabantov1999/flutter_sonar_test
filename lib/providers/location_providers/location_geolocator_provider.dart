
import 'package:geolocator/geolocator.dart';
import 'package:tripy_ev_stable/repositories/location_repository.dart';
import 'package:tripy_ev_stable/schemas/local/app_location_schema/app_location_schema.dart';

class LocationGeolocatorProvider extends LocationRepository {
  @override
  Future<bool> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // first we check for phone location service is enable
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();

    // denied or denied forever means is false
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  @override
  Future<AppLocationSchema> getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 1),
    ).onError((error, stackTrace) async {
      final pos = await Geolocator.getLastKnownPosition();
      return pos ??
          Position(
            longitude: 0,
            latitude: 0,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            altitudeAccuracy: 0,
            heading: 0,
            headingAccuracy: 0,
            speed: 0,
            speedAccuracy: 0,
          );
    });

    AppLocationSchema appLocationModel =
        AppLocationSchema(lat: position.latitude, long: position.longitude);
    return appLocationModel;
  }

  @override
  Future<void> askLocationPermission() async {
    // we ask location permıssıon to user
    await Geolocator.requestPermission();
  }

  @override
  Future<bool> locationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}
