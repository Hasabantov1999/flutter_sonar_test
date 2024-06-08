// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

Map<String, GlobalKey<NavigatorState>> _keys = {
  "default": GlobalKey<NavigatorState>(debugLabel: "default-navigator"),
};

extension AppNavigatorKeysExtension on AppNavigatorKeys {
  GlobalKey<NavigatorState> get find => _keys[key] ?? GlobalKey<NavigatorState>(debugLabel: "not-found");
}

enum AppNavigatorKeys {
  DEFAULT(
    key: "default",
  );

  final String key;
  const AppNavigatorKeys({required this.key});
}
