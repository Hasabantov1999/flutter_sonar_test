import 'package:tripy_ev_stable/repositories/transaction_repository.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';
import 'package:tripy_ev_stable/schemas/http/station_schema/station_schema.dart';
import 'package:tripy_ev_stable/utils/safe_app_busy_utils.dart';

class TransactionService implements TransactionRepository {
  final TransactionRepository provider;
  TransactionService({
    required this.provider,
  });

  @override
  Future<List<StationMiniSchema>> getAllStations() async {
    final res = await SafeAppBusy(
      () => provider.getAllStations(),
    );
    return res;
  }

  @override
  Future<StationSchema> getSingleStation(String id) async {
    final res = await SafeAppBusy(
      () => provider.getSingleStation(id),
    );
    return res;
  }
}
