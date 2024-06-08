import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/color_palette.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';
part "app_theme_extensions.g.theme.dart";

@themeExtensions
class AppThemeExtensions extends ThemeExtension<AppThemeExtensions>
    with _$ThemeExtensionMixin {
  final AppColors colors;
  AppThemeExtensions({
    required this.colors,
  });
}
