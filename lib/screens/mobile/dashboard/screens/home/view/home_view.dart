import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/home/screens/home_charging_area_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/home/viewmodel/home_viewmodel.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/viewmodel/dashboard_view_model.dart';

class HomeView extends ViewModelWidget<DashboardViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return const Scaffold(
          body: HomeChargingAreaView(),
        );
      },
    );
  }
}
