import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tripy_ev_stable/core/components/app_animatet_toggle_switch.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';
import 'package:tripy_ev_stable/schemas/http/station_schema/station_schema.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/station_detail/parts/hours_part.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/station_detail/parts/services_part.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/station_detail/parts/station_part.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/utils/get_status_color.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/viewmodel/map_view_model.dart';

class AppStationDetailView extends StatelessWidget {
  const AppStationDetailView({
    super.key,
    required this.schema,
    required this.controller,
  });
  final StationSchema schema;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<SocketsSchema?> choosedSocket = ValueNotifier(null);
    ValueNotifier<int> bottomTabIndex = ValueNotifier(0);
    return Material(
      borderRadius: AppRadiusPalette.modalRadius,
      child: Column(
        children: [
          SizedBox(
            height: 13.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 6,
              width: 94,
              decoration: BoxDecoration(
                color: context.appThemeExtensions.colors.navBarBorder,
                borderRadius: AppRadiusPalette.borderRadius19,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: context.initialHorizantalPadding,
              child: ListView(
                padding: EdgeInsets.zero,
                controller: controller,
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    children: [
                      AppText(
                        "İstasyon Detay",
                        style: TextStyle(
                          color: context
                              .appThemeExtensions.colors.textPassiveColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            Assets.svgs.map.star,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          AppText(
                            "3,8",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textBlackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          AppText(
                            "(500)",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textPassiveColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppText(
                    schema.title ?? "",
                    width: 312.w,
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  AppText(
                    schema.address ?? "",
                    width: 312.w,
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      AppText(
                        "${(Geolocator.distanceBetween(
                              MAP.userPosition?.lat ?? 0,
                              MAP.userPosition?.long ?? 0,
                              schema.coordinate?.latitude ?? 0,
                              schema.coordinate?.longitude ?? 0,
                            ) / 1000).toStringAsFixed(2)} km",
                        style: TextStyle(
                          color: context.appThemeExtensions.colors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      AppText(
                        "${schema.sockets?.length} Soket Mevcut",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    height: 1,
                    color: context.appThemeExtensions.colors.dividerColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ValueListenableBuilder(
                    valueListenable: choosedSocket,
                    builder: (context, choosedSc, child) {
                      return Column(
                        children: [
                          for (var socket
                              in schema.sockets ?? <SocketsSchema>[])
                            Material(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                    color: context
                                        .appThemeExtensions.colors.dividerColor,
                                  ),
                                )),
                                child: InkWell(
                                  onTap: () {
                                    choosedSocket.value = socket;
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10.h, top: 10.h, right: 10.w),
                                    child: Row(
                                      children: [
                                        Radio<SocketsSchema>(
                                          value: socket,
                                          groupValue: choosedSc,
                                          fillColor: WidgetStatePropertyAll(
                                            context.appThemeExtensions.colors
                                                .primary,
                                          ),
                                          activeColor: context
                                              .appThemeExtensions
                                              .colors
                                              .primary,
                                          onChanged: (val) {
                                            choosedSocket.value = val;
                                          },
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        if (socket.socketType == "Type 2")
                                          SvgPicture.asset(
                                            Assets.svgs.map.ac,
                                          )
                                        else if (socket.socketType ==
                                            "CCS Combo 2")
                                          SvgPicture.asset(
                                            Assets.svgs.map.type2Dc,
                                          )
                                        else
                                          SvgPicture.asset(
                                            Assets.svgs.map.cc1Dc,
                                          ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              socket.socketType ?? "",
                                              style: TextStyle(
                                                color: context
                                                    .appThemeExtensions
                                                    .colors
                                                    .textBlackColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                AppText(
                                                  "${socket.kva ?? 0} KwH",
                                                  style: TextStyle(
                                                    color: context
                                                        .appThemeExtensions
                                                        .colors
                                                        .textBlackColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                Container(
                                                  width: 3,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: context
                                                        .appThemeExtensions
                                                        .colors
                                                        .textBlackColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                AppText(
                                                  StationMiniSchema(
                                                          status: schema.status)
                                                      .getStatusString,
                                                  style: TextStyle(
                                                    color: context
                                                        .appThemeExtensions
                                                        .colors
                                                        .primary,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: EdgeInsets.all(8.w),
                                          decoration: BoxDecoration(
                                            color: context.appThemeExtensions
                                                .colors.primary
                                                .withOpacity(0.1),
                                            borderRadius:
                                                AppRadiusPalette.buttonRadius4,
                                          ),
                                          child: AppText(
                                            "${((schema.whPrice ?? 0) * 1000).toStringAsFixed(2)} TL/KwH",
                                            style: TextStyle(
                                              color: context.appThemeExtensions
                                                  .colors.primary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppButton(
                          onPressed: () async {},
                          width: 128.w,
                          height: 43.w,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: AppRadiusPalette.buttonRadius4,
                            side: BorderSide(
                              color: context.appThemeExtensions.colors.primary,
                            ),
                          ),
                          child: AppText(
                            "Yol Tarifi",
                            style: TextStyle(
                              color: context.appThemeExtensions.colors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        AppButton(
                          onPressed: () async {},
                          height: 43.w,
                          width: 174.w,
                          backgroundColor:
                              context.appThemeExtensions.colors.primary,
                          child: AppText(
                            "Şarjı Başlat",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.whiteTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  ValueListenableBuilder(
                    valueListenable: bottomTabIndex,
                    builder: (context, tabIndex, child) {
                      return AppAnimatedToggleSwitch(
                        index: tabIndex,
                        tabTitles: const [
                          "İstasyon",
                          // "Yorumlar",
                          "Hizmetler",
                          "Saatler",
                        ],
                        onChanged: (index) {
                          bottomTabIndex.value = index;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ValueListenableBuilder(
                    valueListenable: bottomTabIndex,
                    builder: (context, tabIndex, child) {
                      return IndexedStack(
                        index: tabIndex,
                        children: [
                          StationDetailStationPart(
                            schema: schema,
                          ),
                          // StationDetailCommentsPart(
                          //   schema: schema,
                          // ),
                          StationDetailServicesPart(
                            schema: schema,
                          ),
                          StationDetailHoursPart(
                            schema: schema,
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.paddingOf(context).bottom + 20.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
