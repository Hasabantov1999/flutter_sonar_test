import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_animatet_toggle_switch.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_city_state_picker.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_phone_picker_field.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/billing_accounts/add_billing_account/viewmodel/add_billing_account_viewmodel.dart';
part '../pages/individual_billing_page.dart';
part '../pages/institutional_billing_page.dart';

class AddBillingAccountView extends StatelessWidget {
  const AddBillingAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => AddBillingAccountViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: Column(
            children: [
              const AppDashboardAppBar(title: "Fatura Hesabı Ekleyin"),
              ValueListenableBuilder(
                valueListenable: viewModel.tabIndex,
                builder: (context, tabIndex, child) {
                  return Padding(
                    padding: context.initialHorizantalPadding,
                    child: AppAnimatedToggleSwitch(
                      index: tabIndex,
                      indicatorWidth: 200.w,
                      tabTitles: const [
                        "Bireysel",
                        "Kurumsal",
                      ],
                      onChanged: (index) {
                        viewModel.tabIndex.value = index;
                      },
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: viewModel.tabIndex,
                builder: (context, tabIndex, child) {
                  return Expanded(
                    child: IndexedStack(
                      index: tabIndex,
                      children: const [
                        _IndividualBillingPage(),
                        _InstitutionalBillingPage()
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
