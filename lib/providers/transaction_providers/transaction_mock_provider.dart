import 'package:tripy_ev_stable/repositories/transaction_repository.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';
import 'package:tripy_ev_stable/schemas/http/station_schema/station_schema.dart';

class TransactionMockProvider implements TransactionRepository{
  @override
  Future<List<StationMiniSchema>> getAllStations() {
    throw UnimplementedError();
  }

  @override
  Future<StationSchema> getSingleStation(String id) {

    throw UnimplementedError();
  }
  
}