// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  late GlobalKey<NavigatorState> dashboardNavigator;
  late ValueNotifier<int> tabIndex;
  void init() {
    tabIndex = ValueNotifier(1);
    
  }
}

late DashboardViewModel Dashboard;
