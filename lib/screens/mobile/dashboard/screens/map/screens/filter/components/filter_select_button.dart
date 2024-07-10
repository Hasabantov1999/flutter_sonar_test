

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_colored_button.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class FilterSelectionWidget extends StatelessWidget {
  const FilterSelectionWidget({super.key, 
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.width,
  });
  final String text;
  final dynamic value;
  final dynamic groupValue;
  final VoidCallback onChanged;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ColoredChangeBuilder(
      value: value,
      groupValue: groupValue,
      beginColor: context.appThemeExtensions.colors.whiteColor,
      endColor: context.appThemeExtensions.colors.primary.withOpacity(0.8),
      builder: (context, ctColor) {
        return SizedBox(
          width: width,
          child: Material(
            color: ctColor,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadiusPalette.buttonRadius4,
              side: BorderSide(
                color: context.appThemeExtensions.colors.dividerColor,
              ),
            ),
            child: InkWell(
              onTap: onChanged,
              borderRadius: BorderRadius.circular(
                4.r,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: ColoredChangeBuilder(
                    value: value,
                    groupValue: groupValue,
                    beginColor:
                        context.appThemeExtensions.colors.textBlackColor,
                    endColor: context.appThemeExtensions.colors.whiteTextColor,
                    builder: (context, textColor) {
                      return AppText(
                        text,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
