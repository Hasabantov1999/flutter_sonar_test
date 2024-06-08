import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/schemas/http/station_schema/station_schema.dart';

class StationDetailHoursPart extends StatelessWidget {
  const StationDetailHoursPart({
    super.key,
    required this.schema,
  });
  final StationSchema schema;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appThemeExtensions.colors.dividerColor,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 15.w,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.appThemeExtensions.colors.dividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                AppText(
                  "Pazartesi",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  (schema.workingHours?.mondayStart != null &&
                          schema.workingHours?.mondayEnd != null)
                      ? "${schema.workingHours?.mondayStart} - ${schema.workingHours?.mondayEnd}"
                      : "Kapalı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 15.w,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.appThemeExtensions.colors.dividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                AppText(
                  "Salı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  (schema.workingHours?.tuesdayStart != null &&
                          schema.workingHours?.tuesdayEnd != null)
                      ? "${schema.workingHours?.tuesdayStart} - ${schema.workingHours?.tuesdayEnd}"
                      : "Kapalı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 15.w,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.appThemeExtensions.colors.dividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                AppText(
                  "Çarşamba",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  (schema.workingHours?.wednesdayStart != null &&
                          schema.workingHours?.wednesdayEnd != null)
                      ? "${schema.workingHours?.wednesdayStart} - ${schema.workingHours?.wednesdayEnd}"
                      : "Kapalı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 15.w,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.appThemeExtensions.colors.dividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                AppText(
                  "Perşembe",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  (schema.workingHours?.thursdayStart != null &&
                          schema.workingHours?.thursdayEnd != null)
                      ? "${schema.workingHours?.thursdayStart} - ${schema.workingHours?.thursdayEnd}"
                      : "Kapalı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 15.w,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.appThemeExtensions.colors.dividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                AppText(
                  "Cuma",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  (schema.workingHours?.fridayStart != null &&
                          schema.workingHours?.fridayEnd != null)
                      ? "${schema.workingHours?.fridayStart} - ${schema.workingHours?.fridayEnd}"
                      : "Kapalı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 15.w,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.appThemeExtensions.colors.dividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                AppText(
                  "Cumartesi",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  (schema.workingHours?.saturdayStart != null &&
                          schema.workingHours?.saturdayEnd != null)
                      ? "${schema.workingHours?.saturdayStart} - ${schema.workingHours?.saturdayEnd}"
                      : "Kapalı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 15.w,
            ),
            child: Row(
              children: [
                AppText(
                  "Pazar",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  (schema.workingHours?.sundayStart != null &&
                          schema.workingHours?.sundayEnd != null)
                      ? "${schema.workingHours?.sundayStart} - ${schema.workingHours?.sundayEnd}"
                      : "Kapalı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
