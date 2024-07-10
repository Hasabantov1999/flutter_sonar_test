import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/routes/__init__.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/billing_accounts/add_billing_account/view/add_billing_account_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/billing_accounts/components/billing_account_component.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/billing_accounts/viewmodel/billing_accounts_viewmodel.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/viewmodel/dashboard_view_model.dart';

class BillingAccountsView extends StatelessWidget {
  const BillingAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => BillingAccountsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: Column(
            children: [
              const AppDashboardAppBar(
                title: "Fatura Hesaplarım",
              ),
              SizedBox(
                height: 20.w,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BillingAccountComponent(
                        isDefault: true,
                      ),
                      BillingAccountComponent(
                        isDefault: false,
                      ),
                      BillingAccountComponent(
                        isDefault: false,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13.w,
              ),
              Padding(
                padding: context.initialHorizantalPadding,
                child: AppButton(
                  onPressed: () => router.push(
                    const Routes(
                      mobile: AddBillingAccountView(),
                      path: "/profile/billing_account/add_billing_account",
                    ),
                    key: Dashboard.dashboardNavigator,
                  ),
                  child: AppText(
                    "Fatura Hesabı Ekle",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.whiteTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13.w + MediaQuery.paddingOf(context).bottom + 80.w,
              ),
            ],
          ),
        );
      },
    );
  }
}
