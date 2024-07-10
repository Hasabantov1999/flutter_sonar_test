
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/components/filter_select_button.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/viewmodel/filter_modal_view_model.dart';

class SocketPowerType extends ViewModelWidget<FilterModalViewModel> {
  const SocketPowerType({
    super.key,
  });

  @override
  Widget build(BuildContext context,FilterModalViewModel viewModel) {
    return ValueListenableBuilder(
        valueListenable: viewModel.socketPower,
        builder: (context, power, child) {
          return Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
                horizontal: 10.w, vertical: 13.w),
            decoration: BoxDecoration(
              color: context.appThemeExtensions.colors
                  .whiteColor,
              border: Border.all(
                color: context.appThemeExtensions
                    .colors.dividerColor,
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                AppText(
                  "Soket Gücüne Göre",
                  style: TextStyle(
                    color: context.appThemeExtensions
                        .colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 13.w,
                ),
                Divider(
                  color: context.appThemeExtensions
                      .colors.dividerColor,
                  height: 1,
                ),
                SizedBox(
                  height: 13.w,
                ),
                FilterSelectionWidget(
                  text: "AC (22  altı)",
                  value: "AC (22  altı)",
                  groupValue: power,
                  width: context.width,
                  onChanged: () {
                    viewModel.socketPower.value =
                        "AC (22  altı)";
                  },
                ),
                SizedBox(
                  height: 13.w,
                ),
                FilterSelectionWidget(
                  text: "AC Hızlı ( 22 ve 43 arası)",
                  value: "AC Hızlı ( 22 ve 43 arası)",
                  groupValue: power,
                  width: context.width,
                  onChanged: () {
                    viewModel.socketPower.value =
                        "AC Hızlı ( 22 ve 43 arası)";
                  },
                ),
                SizedBox(
                  height: 13.w,
                ),
                FilterSelectionWidget(
                  text: "DC Hızlı (120 ve altı)",
                  value: "DC Hızlı (120 ve altı)",
                  groupValue: power,
                  width: context.width,
                  onChanged: () {
                    viewModel.socketPower.value =
                        "DC Hızlı (120 ve altı)";
                  },
                ),
                SizedBox(
                  height: 13.w,
                ),
                FilterSelectionWidget(
                  text: "DC Ultra Hızlı (120+)",
                  value: "DC Ultra Hızlı (120+)",
                  groupValue: power,
                  width: context.width,
                  onChanged: () {
                    viewModel.socketPower.value =
                        "DC Ultra Hızlı (120+)";
                  },
                ),
              ],
            ),
          );
        });
  }
}