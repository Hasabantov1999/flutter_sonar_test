import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
class AppCityStatePicker extends StatelessWidget {
  const AppCityStatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (context.width / 2) - 30.w,
            child: AppLabelTextField(
              label: "İl",
              suffix: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: context.appThemeExtensions.colors.iconColor,
              ),
            ),
          ),
          SizedBox(
            width: (context.width / 2) - 30.w,
            child: AppLabelTextField(
              label: "İlçe",
              suffix: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: context.appThemeExtensions.colors.iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
