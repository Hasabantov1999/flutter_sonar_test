import 'package:tripy_ev_stable/repositories/base_repository.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';
import 'package:tripy_ev_stable/schemas/http/station_schema/station_schema.dart';

abstract class TransactionRepository implements BaseRepository {
  Future<List<StationMiniSchema>> getAllStations();
  Future<StationSchema> getSingleStation(String id);
}
