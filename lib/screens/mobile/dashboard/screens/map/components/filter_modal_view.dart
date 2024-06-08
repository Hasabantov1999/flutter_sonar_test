import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class FilterModalView extends StatelessWidget {
  const FilterModalView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 609.w,
      child: Material(
        color: context.appThemeExtensions.colors.whiteColor,
      ),
    );
  }
}
