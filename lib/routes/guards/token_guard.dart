// ignore_for_file: non_constant_identifier_names

import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/routes/routes.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';

Future<bool> TokenGuard() async {
  if (LocalCacheService().get.model().accessToken != null) {
    router.go(
      AppRoutes.DASHBOARD.route,
    );
    return false;
  } else {
    return true;
  }
}
