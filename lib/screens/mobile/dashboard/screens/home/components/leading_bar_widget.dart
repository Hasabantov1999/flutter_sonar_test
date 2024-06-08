import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class LeadingBarWidget extends StatelessWidget {
  const LeadingBarWidget({
    super.key,
    required this.path,
    required this.title,
    required this.onPressed,
  });
  final String path;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.initialHorizantalPadding,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                path,
              ),
              SizedBox(
                width: 8.w,
              ),
              AppText(
                title,
                style: TextStyle(
                  color: context.appThemeExtensions.colors.textBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: onPressed,
                child: AppText(
                  "Tümü",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Divider(
            height: 1,
            color: context.appThemeExtensions.colors.dividerColor,
          )
        ],
      ),
    );
  }
}
