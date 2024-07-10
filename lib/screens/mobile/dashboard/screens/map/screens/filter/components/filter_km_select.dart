import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/filter/viewmodel/filter_modal_view_model.dart';

class FilterMaxMinKmSelecter extends ViewModelWidget<FilterModalViewModel> {
  const FilterMaxMinKmSelecter({
    super.key,
  });

  @override
  Widget build(BuildContext context, FilterModalViewModel viewModel) {
    return ValueListenableBuilder(
      valueListenable: viewModel.socketType,
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
                "Mesafe",
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
                  SizedBox(
                    width: 138.w,
                    child: AppLabelTextField(
                      label: "Minimum",
                      controller: viewModel.minTextController,
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  SizedBox(
                    width: 138.w,
                    child: AppLabelTextField(
                      label: "Maksimum",
                      controller: viewModel.maxTextController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
