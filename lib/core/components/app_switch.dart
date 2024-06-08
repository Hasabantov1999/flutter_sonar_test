import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    this.initialValue,
    this.onChanged,
  });
  final bool? initialValue;
  final ValueChanged<bool>? onChanged;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> swtch = ValueNotifier(initialValue ?? false);
    return ValueListenableBuilder(
      valueListenable: swtch,
      builder: (context, val, child) {
        return Switch(
          value: val,
          activeColor: context.appThemeExtensions.colors.primary,
          inactiveThumbColor: context.appThemeExtensions.colors.whiteColor,
          inactiveTrackColor:
              context.appThemeExtensions.colors.textPassiveColor,
          onChanged: (val) {
            swtch.value = val;
            if (onChanged != null) {
              onChanged!(val);
            }
          },
        );
      },
    );
  }
}
