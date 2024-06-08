import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    required this.child,
    this.shape,
    this.width,
    this.height,
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget child;
  final OutlinedBorder? shape;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        elevation: 0,
        padding: EdgeInsets.zero,
        
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        minimumSize: Size(width ?? context.width, height ?? 50.w),
        maximumSize: Size(width ?? context.width, height ?? 50.w),
        fixedSize: Size(width ?? context.width, height ?? 50.w),
        backgroundColor:
            backgroundColor ?? context.appThemeExtensions.colors.primary,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: AppRadiusPalette.buttonRadius4,
            ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
