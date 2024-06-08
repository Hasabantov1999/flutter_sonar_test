// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/config.dart';

Locale get AppInitialLocale => Locale(Config().get.InitialLocale);
List<Locale> get AppSupportedLocales {
  final locales = Config().get.SupportedLocales.split(',');
  List<Locale> sLocales = [];
  for (var locale in locales) {
    sLocales.add(Locale(locale));
  }
  return sLocales;
}
