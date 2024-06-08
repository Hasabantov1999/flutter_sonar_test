import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppLoadingBar extends StatelessWidget {
  const AppLoadingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white24,
        color: context.appThemeExtensions.colors.primary,
      ),
    );
  }
}
