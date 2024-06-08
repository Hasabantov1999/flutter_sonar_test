import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/routes/routes.dart';

class SplashViewModel extends BaseViewModel {
  void init() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // if (LocalCacheService().get.model().accessToken == null) {
        //   router.go(
        //     AppRoutes.AUTH.route,
        //   );
        // } else {
        //   router.go(
        //     AppRoutes.DASHBOARD.route,
        //   );
        // }
        router.go(
          AppRoutes.LOGIN.route,
        );
      },
    );
  }
}
