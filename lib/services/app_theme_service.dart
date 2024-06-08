import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/theme/__init__.dart';
import 'package:tripy_ev_stable/services/base_service.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

Map<String, ThemeData> _themes = {
  "light": AppThemes.LIGHT.get,
  "dark": AppThemes.DARK.get,
};

extension AppThemeServiceExtension on AppThemeService {
  AppThemeService get get => Inject<AppThemeService>();
}

class AppThemeService implements BaseService {
  @override
  Future<void> init() async {
    if (Config().get.Theme != null) {
      if (Config().get.Theme == "light") {
        LocalCacheService().get.model()
          ..theme = AppThemes.LIGHT
          ..save();
      } else {
        LocalCacheService().get.model()
          ..theme = AppThemes.DARK
          ..save();
      }
    } else {
      if (LocalCacheService().get.model().theme == null) {
        _getSystem();
      }
    }
    DeveloperLog.instance.logSuccess(
      "AppThemeService Created Succesfully",
    );
    DeveloperLog.instance.logInfo(
      "App Cache Theme: ${LocalCacheService().get.model().theme}",
    );
    DeveloperLog.instance.logWarning(
      "Conflight App Theme: ${Config().get.Theme ?? "system"}",
    );
  }

  ThemeData _getSystem() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (brightness == Brightness.dark) {
      LocalCacheService().get.model()
        ..theme = AppThemes.DARK
        ..save();
      return AppThemes.DARK.get;
    } else {
      LocalCacheService().get.model()
        ..theme = AppThemes.LIGHT
        ..save();
      return AppThemes.LIGHT.get;
    }
  }

  Future setTheme(AppThemes theme) async {
    DeveloperLog.instance.logSuccess(
      "Theme Changed Succesfully: ${theme.name} Theme",
    );
    return LocalCacheService().get.model()
      ..theme = theme
      ..save();
  }

  ThemeData _getTheme() {
    if (Config().get.Theme != null) {
      return _themes[Config().get.Theme!] ?? ThemeData();
    }
    final cacheTheme = LocalCacheService().get.model().theme;
    if (cacheTheme == null) {
      return _getSystem();
    }
    return _themes[cacheTheme] ?? ThemeData();
  }

  ThemeData get getCurrentTheme => _getTheme();
}
