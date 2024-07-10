// ignore_for_file: non_constant_identifier_names

import 'package:tripy_ev_stable/config.dart';

import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';
import 'package:tripy_ev_stable/services/base_service.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';
import 'package:vexana/vexana.dart';

class VexanaService implements BaseService {
  late INetworkManager<ResponseSchema> _manager;
  INetworkManager<ResponseSchema> get manager => _manager;
  late INetworkManager<ResponseSchema> _manager2;
  INetworkManager<ResponseSchema> get authManager => _manager2;
  @override
  Future<void> init() async {
    DeveloperLog.instance.logSuccess(
      "Auth Manager Created Succesfully.",
    );
    DeveloperLog.instance.logSuccess(
      "Back Office Manager Created Succesfully.",
    );

    _manager = NetworkManager<ResponseSchema>(
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
      onReply: (e) {
        return e.data;
      },
      interceptor: LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
      errorModel: ResponseSchema(),
    );
    _manager2 = NetworkManager<ResponseSchema>(
      options: BaseOptions(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        baseUrl:
            Config().get.DEBUG ? (Config().get.DebugAuth) : (Config().get.Auth),
      ),
      isEnableLogger: true,
      interceptor: LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
      errorModel: ResponseSchema(),
    );
  }
}
