import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroducePageComponent extends StatelessWidget {
  const IntroducePageComponent({
    super.key,
    required this.bgPath,
    this.backButton,
    required this.nextButton,
    required this.title,
    required this.description,
    required this.controller,
  });
  final String bgPath;
  final VoidCallback? backButton;
  final VoidCallback nextButton;
  final String title;
  final String description;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            bgPath,
            width: context.width,
            height: context.height,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              left: false,
              right: false,
              child: ClipRRect(
                borderRadius: AppRadiusPalette.borderRadius19,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 19, sigmaY: 19),
                  child: Container(
                    width: context.width,
                    height: 259.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    margin: context.initialHorizantalPadding,
                    decoration: BoxDecoration(
                      borderRadius: AppRadiusPalette.borderRadius19,
                      color: context.appThemeExtensions.colors.whiteColor
                          .withOpacity(0.35),
                      border: Border.all(
                        color: context.appThemeExtensions.colors.whiteColor
                            .withOpacity(0.67),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            color: context.appThemeExtensions.colors.whiteColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.whiteTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SmoothPageIndicator(
                                controller: controller,
                                count: 3,
                                effect: WormEffect(
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  activeDotColor:
                                      context.appThemeExtensions.colors.primary,
                                  dotColor: context
                                      .appThemeExtensions.colors.passiveColor,
                                ),
                              ),
                              const Spacer(),
                              if (backButton != null)
                                Row(
                                  children: [
                                    AppButton(
                                      onPressed: backButton,
                                      backgroundColor: context
                                          .appThemeExtensions.colors.whiteColor
                                          .withOpacity(0.35),
                                      width: 52.w,
                                      height: 52.w,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: context.appThemeExtensions
                                              .colors.whiteColor,
                                          width: 1.5,
                                        ),
                                        borderRadius:
                                            AppRadiusPalette.buttonRadius4,
                                      ),
                                      child: SvgPicture.asset(
                                        Assets.svgs.leftArrow,
                                        width: 14,
                                        height: 11,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                  ],
                                ),
                              AppButton(
                                onPressed: nextButton,
                                width: 52.w,
                                height: 52.w,
                                child: SvgPicture.asset(
                                  Assets.svgs.rightArrow,
                                  width: 14,
                                  height: 11,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
