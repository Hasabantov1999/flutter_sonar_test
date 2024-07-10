import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/utils/keyboard_utils.dart';

class AppKeyboardWidget extends StatelessWidget {
  const AppKeyboardWidget(
      {super.key, this.onKeyboardOpen, this.onKeyboardClosed});
  final VoidCallback? onKeyboardOpen;
  final VoidCallback? onKeyboardClosed;
  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0 ? true : false;
    if (isKeyboardOpen) {
      if (onKeyboardOpen != null) {
        onKeyboardOpen!();
      }
    } else {
      if (onKeyboardClosed != null) {
        onKeyboardClosed!();
      }
    }
    return Positioned(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      right: 3,
      child: IgnorePointer(
        ignoring: isKeyboardOpen ? false : true,
        child: AnimatedOpacity(
          opacity: isKeyboardOpen ? 1 : 0,
          curve: Curves.easeInCirc,
          duration: const Duration(milliseconds: 300),
          child: AppButton(
            width: 80.w,
            height: 45.w,
            onPressed: () =>
                       KeyboardClose(),
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: context.appThemeExtensions.colors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
