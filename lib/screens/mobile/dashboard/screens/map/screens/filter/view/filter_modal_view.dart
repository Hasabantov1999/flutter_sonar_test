import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/components/filter_km_select.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/components/filter_socket_power_type.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/components/filter_socket_type.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/components/filter_station_type.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/viewmodel/filter_modal_view_model.dart';

class FilterModalView extends StatelessWidget {
  const FilterModalView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => FilterModalViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Align(
            alignment: Alignment.center,
            child: Padding(
              padding: context.initialHorizantalPadding,
              child: SizedBox(
                width: context.width,
                height: 609.w,
                child: Material(
                  color: context.appThemeExtensions.colors.whiteColor,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: context.initialHorizantalPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.w,
                              ),
                              AppText(
                                "Filtreleme",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 13.w,
                              ),
                              Divider(
                                color: context
                                    .appThemeExtensions.colors.dividerColor,
                                height: 1,
                              ),
                              SizedBox(
                                height: 13.w,
                              ),
                              const SocketPowerType(),
                              SizedBox(
                                height: 20.w,
                              ),
                              const FilterStationType(),
                              SizedBox(
                                height: 20.w,
                              ),
                              const FilterSocketType(),
                              SizedBox(
                                height: 20.w,
                              ),
                              const FilterMaxMinKmSelecter(),
                              Builder(builder: (context) {
                                return SizedBox(
                                  height: 80.w +
                                      MediaQuery.viewInsetsOf(context).bottom,
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 13.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppButton(
                                width: 145.w,
                                height: 43.w,
                                backgroundColor: context
                                    .appThemeExtensions.colors.passiveColor
                                    .withOpacity(0.4),
                                onPressed: () {},
                                child: AppText(
                                  "Temizle",
                                  style: TextStyle(
                                    color: context
                                        .appThemeExtensions.colors.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              AppButton(
                                width: 145.w,
                                height: 43.w,
                                backgroundColor:
                                    context.appThemeExtensions.colors.primary,
                                onPressed: () {},
                                child: AppText(
                                  "Filtreyi Uygula",
                                  style: TextStyle(
                                    color: context.appThemeExtensions.colors
                                        .whiteTextColor,
                                    fontSize: 14,
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
              ),
            ),
          );
        });
  }
}
