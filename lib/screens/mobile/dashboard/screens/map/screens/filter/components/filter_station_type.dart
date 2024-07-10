import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/components/filter_select_button.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/viewmodel/filter_modal_view_model.dart';

class FilterStationType extends ViewModelWidget<FilterModalViewModel> {
  const FilterStationType({
    super.key,
  });

  @override
  Widget build(BuildContext context, FilterModalViewModel viewModel) {
    return ValueListenableBuilder(
        valueListenable: viewModel.stationType,
        builder: (context, type, child) {
          return Container(
            width: context.width,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.w),
            decoration: BoxDecoration(
              color: context.appThemeExtensions.colors.whiteColor,
              border: Border.all(
                color: context.appThemeExtensions.colors.dividerColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "İstasyon Tipi",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 13.w,
                ),
                Divider(
                  color: context.appThemeExtensions.colors.dividerColor,
                  height: 1,
                ),
                SizedBox(
                  height: 13.w,
                ),
                Row(
                  children: [
                    FilterSelectionWidget(
                      text: "AC",
                      value: "AC",
                      groupValue: type,
                      onChanged: () {
                        viewModel.stationType.value = "AC";
                      },
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    FilterSelectionWidget(
                      text: "DC",
                      value: "DC",
                      groupValue: type,
                      onChanged: () {
                        viewModel.stationType.value = "DC";
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
