
import 'package:tripy_ev_stable/repositories/location_repository.dart';
import 'package:tripy_ev_stable/schemas/local/app_location_schema/app_location_schema.dart';

class LocationService extends LocationRepository {
  final LocationRepository provider;
  LocationService({
    required this.provider,
  });
  static AppLocationSchema miaLocation = AppLocationSchema(
    lat: 39.7796066,
    long: 32.808473,
  );

  @override
  Future<void> askLocationPermission() => provider.askLocationPermission();
  @override
  Future<bool> checkLocationPermission() => provider.checkLocationPermission();
  @override
  Future<AppLocationSchema> getUserLocation() => provider.getUserLocation();

  @override
  Future<bool> locationServiceEnabled() => provider.locationServiceEnabled();
}
