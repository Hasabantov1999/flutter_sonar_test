import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.padding,
    this.width,
    this.height,
    this.margin,
    this.child,
  });
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: context.appThemeExtensions.colors.navBarBackground,
        borderRadius: AppRadiusPalette.buttonRadius4,
        border: Border.all(
          color: context.appThemeExtensions.colors.navBarBorder,
        ),
      ),
      child: child,
    );
  }
}
