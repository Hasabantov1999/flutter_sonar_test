import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppDashboardAppBar extends StatelessWidget {
  const AppDashboardAppBar({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          SizedBox(
            height: 13.w,
          ),
          Padding(
            padding: context.initialHorizantalPadding,
            child: Row(
              children: [
                SizedBox(
                  width: 45.w,
                  height: 45.w,
                  child: Material(
                    color: context.appThemeExtensions.colors.backButtonBg,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color:
                            context.appThemeExtensions.colors.backButtonStroke,
                      ),
                      borderRadius: AppRadiusPalette.buttonRadius4,
                    ),
                    child: InkWell(
                      onTap:
                          onPressed ?? () => Navigator.of(context).maybePop(),
                      borderRadius: BorderRadius.circular(
                        4.r,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          Assets.svgs.backButton,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                AppText(
                  title,
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.textBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
