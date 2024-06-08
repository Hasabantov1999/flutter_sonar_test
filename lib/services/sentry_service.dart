import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/services/base_service.dart';

class SentryService implements BaseService {
  @override
  Future<void> init() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = Config().get.SentryDsn;
      },
    );
  }
}
