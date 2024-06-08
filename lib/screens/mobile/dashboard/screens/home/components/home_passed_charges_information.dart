import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class HomePassedChargesInformationComponent extends StatelessWidget {
  const HomePassedChargesInformationComponent({
    super.key,
    required this.date,
    required this.stationName,
  });
  final String date;
  final String stationName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.initialHorizantalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            date,
            style: TextStyle(
              color: context.appThemeExtensions.colors.textBlackColor,
              fontSize: 9,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          AppText(
            stationName,
            style: TextStyle(
              color: context.appThemeExtensions.colors.textBlackColor,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            height: 1,
            color: context.appThemeExtensions.colors.dividerColor,
          ),
        ],
      ),
    );
  }
}
