import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/repositories/transaction_repository.dart';
import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';
import 'package:tripy_ev_stable/schemas/http/station_schema/station_schema.dart';
import 'package:tripy_ev_stable/services/vexana_service.dart';
import 'package:vexana/vexana.dart';

class TransactionHttpProvider implements TransactionRepository {
  @override
  Future<List<StationMiniSchema>> getAllStations() async {
    final result = await Inject.get<VexanaService>()
        .manager
        .send<ResponseSchema, ResponseSchema>(
      "user/stations",
      parseModel: ResponseSchema(),
      method: RequestType.GET,
      queryParameters: {
        "page": 1,
        "per_page": 2000,
      },
    );
    if (result.error == null && result.data?.data is List) {
      List<StationMiniSchema> stations = [];
      for (var station in result.data?.data) {
        stations.add(
          StationMiniSchema.fromJson(
            station,
          ),
        );
      }
      return stations;
    }
    return [];
  }

  @override
  Future<StationSchema> getSingleStation(String id) async {
    final result = await Inject.get<VexanaService>()
        .manager
        .send<ResponseSchema, ResponseSchema>(
          "user/stations/$id",
          parseModel: ResponseSchema(),
          method: RequestType.GET,
        );
    if (result.error == null) {
      return StationSchema.fromJson(result.data?.data);
    }
    return StationSchema();
  }
}
