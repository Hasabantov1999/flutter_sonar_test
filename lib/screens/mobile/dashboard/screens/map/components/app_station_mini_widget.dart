// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/repositories/transaction_repository.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/app_marker_widget.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/station_detail/view/app_station_detail_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/utils/get_status_color.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/viewmodel/map_view_model.dart';

class AppStationMiniWidget extends ViewModelWidget<MapViewModel> {
  const AppStationMiniWidget({
    super.key,
    required this.schema,
  });
  final StationMiniSchema schema;
  @override
  Widget build(BuildContext context, MapViewModel viewModel) {
    return Material(
      color: context.appThemeExtensions.colors.whiteColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.appThemeExtensions.colors.dividerColor,
        ),
      ),
      child: SizedBox(
        width: context.width,
        child: InkWell(
          onTap: () async {
            viewModel.upbar.value = false;
            final result =
                await Inject.get<TransactionRepository>().getSingleStation(
              schema.sId ?? "",
            );
            router.modalPush(
              DraggableScrollableSheet(
                minChildSize: 0.5,
                maxChildSize: 0.8,
                initialChildSize: 0.5,
                snapSizes: const [
                  0.5,
                  0.8,
                ],
                builder: (context, scrollController) {
                  return AppStationDetailView(
                    schema: result,
                    controller: scrollController,
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 13.w,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: AppMarkerWidget(
                    color: schema.getStatusColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 250.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        schema.title ?? "",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              borderRadius: AppRadiusPalette.buttonRadius4,
                              color: context.appThemeExtensions.colors.primary
                                  .withOpacity(0.1),
                            ),
                            child: AppText(
                              "${((Geolocator.distanceBetween(
                                    viewModel.userPosition?.lat ?? 0,
                                    viewModel.userPosition?.long ?? 0,
                                    schema.coordinate?.latitude ?? 0,
                                    schema.coordinate?.longitude ?? 0,
                                  ) / 1000).toStringAsFixed(2))} Km",
                              style: TextStyle(
                                color:
                                    context.appThemeExtensions.colors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              borderRadius: AppRadiusPalette.buttonRadius4,
                              color: schema.getStatusColor.withOpacity(0.1),
                            ),
                            child: AppText(
                              schema.getStatusString,
                              style: TextStyle(
                                color: schema.getStatusColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          if (schema.powerType == "AC")
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                borderRadius: AppRadiusPalette.buttonRadius4,
                                color: context
                                    .appThemeExtensions.colors.modalRedColor
                                    .withOpacity(0.1),
                              ),
                              child: AppText(
                                schema.getSocketType,
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.modalRedColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          else
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                borderRadius: AppRadiusPalette.buttonRadius4,
                                color: context
                                    .appThemeExtensions.colors.modalRedColor,
                              ),
                              child: AppText(
                                schema.getSocketType,
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  Assets.svgs.map.iconRedirect,
                  color: context.appThemeExtensions.colors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
