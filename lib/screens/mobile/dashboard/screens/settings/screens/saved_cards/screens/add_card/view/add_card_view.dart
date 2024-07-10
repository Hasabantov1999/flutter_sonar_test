import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/saved_cards/screens/add_card/viewmodel/add_card_viewmodel.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => AddCardViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AppDashboardAppBar(
                  title: "Kart Ekleyin",
                ),
                Padding(
                  padding: context.initialHorizantalPadding,
                  child: Column(
                    children: [
                      const AppLabelTextField(
                        label: "Kartınıza İsim Verin",
                      ),
                      SizedBox(
                        height: 13.w,
                      ),
                      const AppLabelTextField(
                        label: "Kart Sahibi",
                      ),
                      SizedBox(
                        height: 13.w,
                      ),
                      const AppLabelTextField(
                        label: "Kart Numarası",
                      ),
                      SizedBox(
                        height: 13.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (context.width / 2) - 30.w,
                            child: const AppLabelTextField(
                              label: "Son Kullanma Tarihi",
                            ),
                          ),
                          SizedBox(
                            width: (context.width / 2) - 30.w,
                            child: const AppLabelTextField(
                              label: "CVC",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      AppButton(
                        onPressed: () {},
                        child: AppText(
                          "Kaydet",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.whiteTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
