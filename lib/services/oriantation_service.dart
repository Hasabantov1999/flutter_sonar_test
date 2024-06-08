import 'package:flutter/services.dart';
import 'package:tripy_ev_stable/services/base_service.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

class OriantationService implements BaseService {
  @override
  Future<void> init() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    DeveloperLog.instance.logInfo(
      {
        "DeviceOrientations": [
          "DeviceOrientation.portraitUp",
          "DeviceOrientation.portraitDown",
        ]
      },
    );
  }
}
