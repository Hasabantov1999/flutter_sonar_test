import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/tariffs_and_packets/viewmodel/tariffs_and_packages_viewmodel.dart';

class TariffsAndPackagesView extends StatelessWidget {
  const TariffsAndPackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => TariffsAndPackagesViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppDashboardAppBar(
                  title: "Tarife ve Kampanyalar",
                ),
                SizedBox(
                  height: 30.w,
                ),
                Padding(
                  padding: context.initialHorizantalPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          SvgPicture.asset(
                            Assets.svgs.logo,
                            width: 54.w,
                            height: 40.w,
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Expanded(
                            child: AppText(
                              "Tripy üyelerine tüm şarj tariflerimize %5 indirim uygulanmaktadır.",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 13.w,
                      ),
                      Divider(
                        color: context.appThemeExtensions.colors.dividerColor,
                        height: 1,
                      ),
                      SizedBox(
                        height: 25.w,
                      ),
                      AppText(
                        "AC Şarj Tarifeleri",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 13.w,
                      ),
                      Divider(
                        color: context.appThemeExtensions.colors.dividerColor,
                        height: 1,
                      ),
                      const _TariffsComponent(),
                      const _TariffsComponent(),
                      const _TariffsComponent(),
                      SizedBox(
                        height: 13.w,
                      ),
                      AppText(
                        "DC Şarj Tarifeleri",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 13.w,
                      ),
                      const _TariffsComponent(),
                      const _TariffsComponent(),
                      const _TariffsComponent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TariffsComponent extends StatelessWidget {
  const _TariffsComponent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 13.w,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.appThemeExtensions.colors.passiveColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(6.w),
              child: SvgPicture.asset(
                Assets.svgs.stationCharge,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            AppText(
              "22 KwH’ a kadar tüm soketler",
              style: TextStyle(
                color: context.appThemeExtensions.colors.textBlackColor,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.w,
              ),
              decoration: BoxDecoration(
                color: context.appThemeExtensions.colors.passiveColor,
                borderRadius: AppRadiusPalette.buttonRadius4,
              ),
              child: AppText(
                "7.80 TL/KwH",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.primary,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 13.w,
        ),
        Divider(
          color: context.appThemeExtensions.colors.dividerColor,
          height: 1,
        ),
      ],
    );
  }
}
