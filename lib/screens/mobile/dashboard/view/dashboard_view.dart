import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_tabs_router.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';

import 'package:tripy_ev_stable/screens/mobile/dashboard/components/app_bottom_bar.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/home/view/home_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/view/map_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/view/settings_view.dart';

import 'package:tripy_ev_stable/screens/mobile/dashboard/viewmodel/dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => Dashboard,
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return ValueListenableBuilder(
          valueListenable: viewModel.tabIndex,
          builder: (context, tabIndex, child) {
            return Stack(
              children: [
                Scaffold(
                  body: AppTabsRouter(
                    childs: const [
                      HomeView(),
                      MapView(),
                      SettingsView(),
                    ],
                    onChanged: (key) {
                      Dashboard.dashboardNavigator = key;
                    },
                    tabIndex: tabIndex,
                  ),
                  primary: false,
                  resizeToAvoidBottomInset: true,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AppBottomNavBar(
                    childrens: [
                      AppBottomNavBarItem(
                        text: "Anasayfa",
                        path: Assets.svgs.dashboardNavHome,
                        index: 0,
                        tabIndex: tabIndex,
                      ),
                      AppBottomNavBarItem(
                        text: "Harita",
                        path: Assets.svgs.dashboardNavMap,
                        index: 1,
                        tabIndex: tabIndex,
                      ),
                      AppBottomNavBarItem(
                        text: "Ayarlar",
                        path: Assets.svgs.dashboardNavSettings,
                        index: 2,
                        tabIndex: tabIndex,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
