// ignore_for_file: non_constant_identifier_names

import 'package:tripy_ev_stable/config.dart';

import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';
import 'package:tripy_ev_stable/services/base_service.dart';

import 'package:tripy_ev_stable/default_modules/vexana/lib/vexana.dart';
import 'package:tripy_ev_stable/utils/error_model.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

class VexanaService implements BaseService {
  late INetworkManager _manager;
  INetworkManager get manager => _manager;
  @override
  Future<void> init() async {
    DeveloperLog.instance.logSuccess(
      "Auth Manager Created Succesfully.",
    );
    DeveloperLog.instance.logSuccess(
      "Back Office Manager Created Succesfully.",
    );
    _manager =NetworkManager<ResponseSchema>(
      options: BaseOptions(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        baseUrl: Config().get.DEBUG
            ? (Config().get.DebugBackOffice)
            : (Config().get.BackOffice),
      ),
      isEnableLogger: true,
      errorModel: ResponseSchema(),
      errorModelFromData: ErrorSchemaBuilder,
    );
  }
}
