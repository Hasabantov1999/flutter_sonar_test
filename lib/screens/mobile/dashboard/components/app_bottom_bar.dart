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
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/viewmodel/dashboard_view_model.dart';
import 'package:tripy_ev_stable/utils/keyboard_utils.dart';

class AppBottomNavBar extends ViewModelWidget<DashboardViewModel> {
  const AppBottomNavBar({
    super.key,
    required this.childrens,
  });
  final List<Widget> childrens;
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: 13.w),
        child: Container(
          margin: context.initialHorizantalPadding,
          height: 62.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: context.appThemeExtensions.colors.navBarBorder,
              width: 1,
            ),
            color: context.appThemeExtensions.colors.navBarBackground,
            borderRadius: AppRadiusPalette.buttonRadius4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: childrens,
          ),
        ),
      ),
    );
  }
}

class AppBottomNavBarItem extends ViewModelWidget<DashboardViewModel> {
  const AppBottomNavBarItem({
    super.key,
    required this.text,
    required this.path,
    required this.index,
    required this.tabIndex,
  });
  final String text;
  final String path;
  final int index;
  final int tabIndex;
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Expanded(
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(
          begin: index == tabIndex
              ? context.appThemeExtensions.colors.textPassiveColor
              : context.appThemeExtensions.colors.primary,
          end: index == tabIndex
              ? context.appThemeExtensions.colors.primary
              : context.appThemeExtensions.colors.textPassiveColor,
        ),
        duration: const Duration(milliseconds: 300),
        builder: (context, color, child) {
          return TextButton(
            onPressed: () {
              viewModel.tabIndex.value = index;
              KeyboardClose();
              router.navigate(viewModel.dashboardNavigator);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.svgs.dashboardNavHome,
                  color: color,
                ),
                SizedBox(
                  width: 7.w,
                ),
                AppText(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
