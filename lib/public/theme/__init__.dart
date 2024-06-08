// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tripy_ev_stable/public/theme/app_dark_theme/color_palette/color_palette_extensions.dart';
import 'package:tripy_ev_stable/public/theme/app_light_theme/colors/color_palette_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
part "app_light_theme/app_light_theme.dart";
part "app_dark_theme/app_dark_theme.dart";
part '__init__.g.dart';

extension AppThemesExtension on AppThemes {
  ThemeData get get => _themes[key] ?? ThemeData();
}

Map<String, ThemeData> _themes = {
  "light": _appLightTheme,
  "dark": _appDarkTheme,
};

@HiveType(typeId: 1)
enum AppThemes {
  @HiveField(0)
  LIGHT(key: "light"),
  @HiveField(1)
  DARK(key: "dark");

  final String key;
  const AppThemes({required this.key});
}
