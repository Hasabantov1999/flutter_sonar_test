// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:tripy_ev_stable/routes/__init__.dart';
import 'package:tripy_ev_stable/routes/guards/dashboard_guard.dart';
import 'package:tripy_ev_stable/routes/guards/location_guard.dart';
import 'package:tripy_ev_stable/routes/guards/login_guard.dart';
import 'package:tripy_ev_stable/routes/guards/map_guard.dart';
import 'package:tripy_ev_stable/screens/mobile/auth/screens/forget_password/view/forget_password_view.dart';
import 'package:tripy_ev_stable/screens/mobile/auth/screens/login/view/login_view.dart';
import 'package:tripy_ev_stable/screens/mobile/auth/screens/register/view/register_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/view/dashboard_view.dart';
import 'package:tripy_ev_stable/screens/mobile/introduce/view/introduce_view.dart';

import 'package:tripy_ev_stable/screens/mobile/splash/view/splash_view.dart';

Routes get GetInitialPage =>
    AppRoutes.values.firstWhere((element) => element.route.path == "/").route;

enum AppRoutes {
  SPLASH(
    route: Routes(
      mobile: SplashView(),
      path: "/",
    ),
  ),
  INTRODUCE(
    route: Routes(
      mobile: IntroduceView(),
      path: "/introduce",
    ),
  ),
  LOGIN(
    route: Routes(
      mobile: LoginView(),
      routeGuard: LoginGuard,
      path: "/login",
    ),
  ),

  REGISTER(
    route: Routes(
      mobile: RegisterView(),
      path: "/register",
    ),
  ),
  FORGETPASSWORD(
    route: Routes(
      mobile: ForgetPasswordView(),
      path: "/forgetpassword",
    ),
  ),
  DASHBOARD(
    route: Routes(
      mobile: DashboardView(),
      multipleRouteGuard: [
        DashboardGuard,
        LocationGuards,
        MapGuard,
      ],
      path: "/dashboard",
    ),
  );

  final Routes route;
  const AppRoutes({required this.route});
}
