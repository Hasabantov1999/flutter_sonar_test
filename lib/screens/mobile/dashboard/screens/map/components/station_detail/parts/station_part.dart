import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/schemas/http/station_schema/station_schema.dart';

class StationDetailStationPart extends StatelessWidget {
  const StationDetailStationPart({
    super.key,
    required this.schema,
  });
  final StationSchema schema;
  @override
  Widget build(BuildContext context) {
    int useableStations = 0;
    for (var element in schema.sockets ?? <SocketsSchema>[]) {
      if (element.status == 'active') {
        useableStations += 1;
      }
    }
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
                  "Durumu",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  "Uygun($useableStations/${schema.sockets?.length ?? 0})",
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
                  "Hizmet Tipi",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  "Halka Açık",
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
                  "Modeli",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  schema.model ?? "",
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
                  "Güç",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                AppText(
                  schema.powerType ?? "",
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
