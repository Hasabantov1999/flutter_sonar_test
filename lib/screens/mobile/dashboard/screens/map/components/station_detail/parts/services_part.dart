import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/schemas/http/station_schema/station_schema.dart';

class StationDetailServicesPart extends StatelessWidget {
  const StationDetailServicesPart({
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
                  "Şarj Servisi",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  schema.service!.chargeService != null &&
                          schema.service!.chargeService == 'self'
                      ? "Self Servis"
                      : "Kontrollü",
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
                  "Rezervasyon",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  schema.service!.reservation != null &&
                          schema.service!.reservation!
                      ? "Var"
                      : "Yok",
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
                  "Park Alanı",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  schema.service!.parkArea != null &&
                          schema.service!.parkArea != 0
                      ? '${schema.service!.parkArea} Araç'
                      : "Yok",
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
                  "Ücretsiz Park",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  schema.service!.freePark != null && schema.service!.freePark!
                      ? "Var"
                      : "Yok",
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
