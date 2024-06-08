// ignore_for_file: non_constant_identifier_names

import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/routes/routes.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';

Future<bool> LoginGuard() async {
  if (LocalCacheService().get.model().introduceView == true) {
    return true;
  } else {
    LocalCacheService().get.model()
      ..introduceView = true
      ..save();
    router.go(
      AppRoutes.INTRODUCE.route,
    );
    return false;
  }
}
