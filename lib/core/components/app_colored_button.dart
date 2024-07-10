import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class ColoredChangeBuilder extends StatelessWidget {
  const ColoredChangeBuilder({
    super.key,
    required this.value,
    required this.groupValue,
    this.beginColor,
    this.endColor,
    required this.builder,
    this.duration,
  });
  final dynamic value;
  final dynamic groupValue;
  final Color? beginColor;
  final Color? endColor;
  final Duration? duration;
  final Widget Function(
    BuildContext ctx,
    Color? ctColor,
  ) builder;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(
        begin: value == groupValue
            ? (beginColor ?? context.appThemeExtensions.colors.whiteColor)
            : (endColor ??
                context.appThemeExtensions.colors.passiveColor
                    .withOpacity(0.3)),
        end: value == groupValue
            ? (endColor ??
                context.appThemeExtensions.colors.passiveColor.withOpacity(0.3))
            : (beginColor ?? context.appThemeExtensions.colors.whiteColor),
      ),
      duration: duration ?? const Duration(milliseconds: 300),
      builder: (context, ctColor, child) {
        return builder(context, ctColor);
      },
    );
  }
}
