import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppAnimatedToggleSwitch extends StatelessWidget {
  const AppAnimatedToggleSwitch({
    super.key,
    required this.index,
    this.onChanged,
    required this.tabTitles,
    this.fontSize,
    this.indicatorWidth,
  });
  final int index;
  final ChangeCallback<int>? onChanged;
  final List<String> tabTitles;
  final double? fontSize;
  final double? indicatorWidth;
  @override
  Widget build(BuildContext context) {
    List<int> values = [];
    int i = 0;
    // ignore: unused_local_variable
    for (var element in tabTitles) {
      values.add(i);
      i++;
    }
    return SizedBox(
      width: double.infinity,
      child: AnimatedToggleSwitch<int>.size(
        current: index,
        onChanged: onChanged,
        values: values,
        height: 52.h,
        indicatorAnimationType: AnimationType.onHover,
        selectedIconScale: 1,
        selectedIconOpacity: 1,
        iconList: [
          for (int i = 0; i < tabTitles.length; i++)
            Material(
              color: Colors.transparent,
              borderRadius: AppRadiusPalette.buttonRadius4,
              child: Text(
                tabTitles[i],
                style: TextStyle(
                  color: context.appThemeExtensions.colors.textBlackColor,
                  fontSize: 14,
                  fontWeight: index == i ? FontWeight.w800 : FontWeight.w400,
                ),
              ),
            ),
        ],
        iconOpacity: 1,
        indicatorSize: Size.fromWidth(indicatorWidth ?? 130.w),
        borderWidth: 4.0,
        iconAnimationType: AnimationType.onHover,
        style: ToggleStyle(
          backgroundColor: context.appThemeExtensions.colors.dividerColor,
          indicatorColor: context.appThemeExtensions.colors.whiteTextColor,
          borderColor: Colors.transparent,
          borderRadius: AppRadiusPalette.buttonRadius4,
        ),
      ),
    );
  }
}
