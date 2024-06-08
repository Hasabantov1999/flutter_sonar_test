import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_card.dart';
import 'package:tripy_ev_stable/core/components/app_gradient_circular_progress_indicator.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/gradients/app_gradient_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/home/components/home_top_bar.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/home/viewmodel/home_viewmodel.dart';

class HomeChargingAreaView extends ViewModelWidget<HomeViewModel> {
  const HomeChargingAreaView({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.paddingOf(context).top + 20.h,
          ),
          const HomeTopBar(),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 300.w,
            height: 300.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.8,
                    child: SvgPicture.asset(
                      Assets.svgs.home.bgCircularProgress,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    heightFactor: 0.7,
                    child: Transform.rotate(
                      angle: 3.6,
                      child: GradientCircularProgressIndicator(
                        progress: 0.6,
                        gradient: AppGradientPalette.circularProgressGradient,
                        stroke: 32.w,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: SvgPicture.asset(
                      Assets.svgs.home.circularProgressDot,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    Assets.images.homeCar.path,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Lottie.asset(
                    Assets.jsons.loadingCharge,
                    width: 150.w,
                    height: 250.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.w),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          "78",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.w),
                          child: AppText(
                            "%",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textBlackColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppCard(
            margin: context.initialHorizantalPadding,
            padding: EdgeInsets.all(15.w),
            width: context.width,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: context.appThemeExtensions.colors.primary
                      .withOpacity(0.1),
                  child: SvgPicture.asset(
                    Assets.svgs.home.station,
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "İstasyon",
                      style: TextStyle(
                        color: context.appThemeExtensions.colors.textBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Gazi Üniversitesi Gölbaşı Yerleşkesi ARGE İstasyonu",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text: "#CSS Combo2",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        maxLines: 2,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: context.initialHorizantalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: AppCard(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: context
                              .appThemeExtensions.colors.primary
                              .withOpacity(0.1),
                          child: SvgPicture.asset(
                            Assets.svgs.home.time,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        AppText(
                          "Geçen Süre",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        AppText(
                          "01:04:20",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: AppCard(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: context
                              .appThemeExtensions.colors.primary
                              .withOpacity(0.1),
                          child: SvgPicture.asset(
                            Assets.svgs.home.usableEnergy,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        AppText(
                          "Tük. Enerji",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        AppText(
                          "0.02 KwH",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: AppCard(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: context
                              .appThemeExtensions.colors.primary
                              .withOpacity(0.1),
                          child: SvgPicture.asset(
                            Assets.svgs.home.price,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        AppText(
                          "Tutar",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        AppText(
                          "300.00 TL",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: context.initialHorizantalPadding,
            child: AppButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    "Şarjı Sonlandır",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.whiteTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SvgPicture.asset(
                    Assets.svgs.home.chargeStop,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
