import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppSquareButton extends StatelessWidget {
  const AppSquareButton({
    super.key,
    required this.onPressed,
    required this.path,
    this.backgroundColor,
    this.shape,
  });
  final VoidCallback onPressed;
  final String path;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      shape:shape ?? RoundedRectangleBorder(
        borderRadius: AppRadiusPalette.buttonRadius4,
        side: BorderSide(
          color: context.appThemeExtensions.colors.textPassiveColor,
          width: 1.5,
        ),
      ),
      minWidth: 52.w,
      height: 52.w,
      child: SvgPicture.asset(
        path,
      ),
    );
  }
}
