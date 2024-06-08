import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/home/components/home_passed_charges_information.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/home/components/home_top_bar.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/home/components/leading_bar_widget.dart';
class HomeNormalArea extends StatelessWidget {
  const HomeNormalArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.paddingOf(context).top + 20.h,
          ),
          const HomeTopBar(),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: context.width,
            margin: context.initialHorizantalPadding,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: context.appThemeExtensions.colors.primary
                  .withOpacity(0.1),
              borderRadius: AppRadiusPalette.buttonRadius4,
            ),
            child: AppText(
              "Akif şarj işleminiz bulunmamaktadır.",
              style: TextStyle(
                color: context.appThemeExtensions.colors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          LeadingBarWidget(
            path: Assets.svgs.home.process,
            title: "İşlemlerim",
            onPressed: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
          const HomePassedChargesInformationComponent(
            date: "23 Nisan 2023 Çarşamba 12.00",
            stationName: "Konya Teknokent 1 Nolu DC İstasyon",
          ),
          SizedBox(
            height: 20.h,
          ),
          const HomePassedChargesInformationComponent(
            date: "23 Nisan 2023 Çarşamba 12.00",
            stationName: "Konya Teknokent 1 Nolu DC İstasyon",
          ),
          SizedBox(
            height: 20.h,
          ),
          const HomePassedChargesInformationComponent(
            date: "23 Nisan 2023 Çarşamba 12.00",
            stationName: "Konya Teknokent 1 Nolu DC İstasyon",
          ),
          SizedBox(
            height: 20.h,
          ),
          LeadingBarWidget(
            path: Assets.svgs.home.packets,
            title: "Tarife ve Paketler",
            onPressed: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: context.initialHorizantalPadding,
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                SvgPicture.asset(
                  Assets.svgs.logo,
                  width: 50.w,
                  height: 40.w,
                ),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Tripy üyelerine tüm şarj tariflerimize ",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "%5 indirim ",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: "uygulanmaktadır.",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
