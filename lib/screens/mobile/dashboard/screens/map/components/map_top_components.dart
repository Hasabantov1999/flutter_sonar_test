// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/shadows/app_shadow_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/app_station_mini_widget.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/filter_modal_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/viewmodel/map_view_model.dart';

class MapTopSearchBar extends ViewModelWidget<MapViewModel> {
  const MapTopSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, MapViewModel viewModel) {
    return Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: ValueListenableBuilder(
          valueListenable: viewModel.upbar,
          builder: (context, upBarOpened, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: context.width,
                  padding: EdgeInsets.all(8.w),
                  margin: EdgeInsets.only(
                    top: 13.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  decoration: BoxDecoration(
                    color: context.appThemeExtensions.colors.scaffoldBgColor,
                    borderRadius: upBarOpened
                        ? BorderRadius.only(
                            topLeft: Radius.circular(4.r),
                            topRight: Radius.circular(4.r),
                          )
                        : AppRadiusPalette.buttonRadius4,
                    boxShadow: AppShadowPalette.standartCardShadow,
                  ),
                  child: TextFormField(
                    focusNode: viewModel.searchBarFocusNode,
                    cursorColor: context.appThemeExtensions.colors.primary,
                    onTap: () {
                      viewModel.upbar.value = true;
                    },
                    onTapOutside: (val) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: context.appThemeExtensions.colors.textBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      labelText: "İstasyon, Konum, Adres Ara",
                      floatingLabelStyle: TextStyle(
                        color: context.appThemeExtensions.colors.textBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ).copyWith(
                        color: context.appThemeExtensions.colors.primary,
                      ),
                      hintStyle: TextStyle(
                        color: context.appThemeExtensions.colors.textBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: SvgPicture.asset(
                          Assets.svgs.map.search,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxWidth: 40.w,
                        maxHeight: 40.w,
                      ),
                      suffixIcon: MaterialButton(
                        onPressed: () => router.modalPush(
                          const FilterModalView(),
                        ),
                        minWidth: 40.w,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadiusPalette.buttonRadius4,
                        ),
                        color: context.appThemeExtensions.colors.primary,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: SvgPicture.asset(
                          Assets.svgs.map.filter,
                          color:
                              context.appThemeExtensions.colors.whiteTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: upBarOpened ? false : true,
                  child: AnimatedOpacity(
                    opacity: upBarOpened ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: context.width,
                      margin: context.initialHorizantalPadding,
                      height: upBarOpened ? null : 0,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: context.appThemeExtensions.colors.whiteColor,
                        boxShadow: AppShadowPalette.standartCardShadow,
                      ),
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 1000),
                        reverseDuration: const Duration(milliseconds: 1000),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: context.height * 0.4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Yakınımdaki İstasyonlar",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              Divider(
                                height: 1,
                                color: context
                                    .appThemeExtensions.colors.dividerColor,
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              Expanded(
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        for (var station in viewModel.stations)
                                          AppStationMiniWidget(
                                            schema: station,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
