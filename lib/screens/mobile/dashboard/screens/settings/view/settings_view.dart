import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, viewModel, child) {
        return const Scaffold();
      },
    );
  }
}
