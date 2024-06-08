import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_square_button.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: context.initialHorizantalPadding,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.appThemeExtensions.colors.dividerColor,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 13.h),
        child: Row(
          children: [
            AppText(
              "Merhaba, ",
              style: TextStyle(
                color:
                    context.appThemeExtensions.colors.textBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            AppText(
              "Serdar 👋",
              style: TextStyle(
                color:
                    context.appThemeExtensions.colors.textBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            AppSquareButton(
              onPressed: () {},
              path: Assets.svgs.home.notification,
            ),
          ],
        ),
      ),
    );
  }
}
