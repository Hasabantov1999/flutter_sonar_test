import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripy_ev_stable/core/components/app_loading_bar.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppSuccessWidget extends StatelessWidget {
  const AppSuccessWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 315.w,
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: context.appThemeExtensions.colors.scaffoldBgColor,
          borderRadius: AppRadiusPalette.borderRadius19,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.svgs.smsSuccess,
            ),
            SizedBox(
              height: 13.h,
            ),
            AppText(
              title,
              style: TextStyle(
                color: context.appThemeExtensions.colors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            AppText(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.appThemeExtensions.colors.textBlackColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const AppLoadingBar(),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
