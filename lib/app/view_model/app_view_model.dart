import 'package:flutter/cupertino.dart';
import 'package:tripy_ev_stable/public/theme/__init__.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';
import 'package:stacked/stacked.dart';

class AppViewModel extends BaseViewModel {
  void notify() => notifyListeners();
  void init(BuildContext context) {
    if (LocalCacheService().get.model().theme == null) {
      final brightness = MediaQuery.of(context).platformBrightness;
      if (brightness == Brightness.dark) {
        LocalCacheService().get.model()
          ..theme = AppThemes.DARK
          ..save();
      } else {
        LocalCacheService().get.model()
          ..theme = AppThemes.LIGHT
          ..save();
      }
    }
  }
}
