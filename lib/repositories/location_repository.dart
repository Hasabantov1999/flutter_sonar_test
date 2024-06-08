
import 'package:tripy_ev_stable/repositories/base_repository.dart';

import '../schemas/local/app_location_schema/app_location_schema.dart';

abstract class LocationRepository implements BaseRepository {
  Future<AppLocationSchema> getUserLocation();

  Future<bool> checkLocationPermission();

  Future<void> askLocationPermission();

  Future<bool> locationServiceEnabled();
}
