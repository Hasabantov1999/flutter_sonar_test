import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/passed_charges/components/passed_charges_component.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/passed_charges/viewmodel/passed_charges_viewmodel.dart';

class PassedChargesView extends StatelessWidget {
  const PassedChargesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => PassedChargesViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: Column(
            children: [
              const AppDashboardAppBar(
                title: "İşlemlerim",
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PassedChargesComponent(),
                      PassedChargesComponent(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.w + MediaQuery.paddingOf(context).bottom,
              ),
            ],
          ),
        );
      },
    );
  }
}
