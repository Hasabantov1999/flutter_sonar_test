import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/core/components/app_switch.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/app_settings/viewmodel/app_settings_viewmodel.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => AppSettingsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: Column(
            children: [
              const AppDashboardAppBar(
                title: "Uygulama Ayarları",
              ),
              SizedBox(
                height: 30.w,
              ),
              Material(
                color: context.appThemeExtensions.colors.scaffoldBgColor,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            height: 13.w,
                          ),
                          Padding(
                            padding: context.initialHorizantalPadding,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.svgs.appLanguage,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(
                                  "Uygulama Dili",
                                  style: TextStyle(
                                    color: context.appThemeExtensions.colors
                                        .textBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                AppText(
                                  "Türkçe",
                                  style: TextStyle(
                                    color: context.appThemeExtensions.colors
                                        .textBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
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
              ),
              Material(
                color: context.appThemeExtensions.colors.scaffoldBgColor,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            height: 13.w,
                          ),
                          Padding(
                            padding: context.initialHorizantalPadding,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.svgs.theme,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(
                                  "Karanlık Tema",
                                  style: TextStyle(
                                    color: context.appThemeExtensions.colors
                                        .textBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                const AppSwitch(),
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
              ),
              Material(
                color: context.appThemeExtensions.colors.scaffoldBgColor,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            height: 13.w,
                          ),
                          Padding(
                            padding: context.initialHorizantalPadding,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.svgs.appPermissions,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(
                                  "Cihaz İzinleri",
                                  style: TextStyle(
                                    color: context.appThemeExtensions.colors
                                        .textBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
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
              ),
            ],
          ),
        );
      },
    );
  }
}



