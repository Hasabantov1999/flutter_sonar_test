import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/help/viewmodel/help_viewmodel.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HelpViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: Column(
            children: [
              const AppDashboardAppBar(
                title: "Yardım",
              ),
              SizedBox(
                height: 30.w,
              ),
              _HelpComponent(
                onTap: () {},
                title: "Yasal Bilgiler",
              ),
              _HelpComponent(
                onTap: () {},
                title: "Sıkça Sorulan Sorular",
              ),
              _HelpComponent(
                onTap: () {},
                title: "Şarj Klavuzu",
              ),
              _HelpComponent(
                onTap: () {},
                title: "Bize Ulaşın",
              ),
              _HelpComponent(
                onTap: () {},
                title: "Hakkımızda",
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HelpComponent extends StatelessWidget {
  const _HelpComponent({
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appThemeExtensions.colors.scaffoldBgColor,
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Column(
              children: [
                SizedBox(
                  height: 13.w,
                ),
                Padding(
                  padding: context.initialHorizantalPadding,
                  child: Row(
                    children: [
                      AppText(
                        title,
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: context.appThemeExtensions.colors.iconColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13.w,
                ),
              ],
            ),
          ),
          Divider(
            color: context.appThemeExtensions.colors.dividerColor,
          ),
        ],
      ),
    );
  }
}
