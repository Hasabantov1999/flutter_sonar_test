import 'package:flutter/material.dart';

import 'package:tripy_ev_stable/services/app_theme_service.dart';

class ThemeDataWidgetBinding extends StatefulWidget {
  const ThemeDataWidgetBinding({
    super.key,
    required this.builder,
  });
  final Widget Function(BuildContext context, ThemeData? theme) builder;

  @override
  State<ThemeDataWidgetBinding> createState() => _ThemeDataWidgetBindingState();
}

class _ThemeDataWidgetBindingState extends State<ThemeDataWidgetBinding>
    with WidgetsBindingObserver {
  @override
  void initState() {
    AppThemeService().get.init();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      AppThemeService().get.getCurrentTheme,
    );
  }
}
