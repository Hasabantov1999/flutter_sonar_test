// ignore_for_file: non_constant_identifier_names

import 'package:tripy_ev_stable/screens/mobile/dashboard/viewmodel/dashboard_view_model.dart';

Future<bool> DashboardGuard() async {
  Dashboard = DashboardViewModel();
  return true;
}
