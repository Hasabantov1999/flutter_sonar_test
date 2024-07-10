import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class BillingAccountComponent extends StatelessWidget {
  const BillingAccountComponent({
    super.key,
    required this.isDefault,
  });
  final bool isDefault;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 8.w,
      ),
      padding: EdgeInsets.all(
        8.w,
      ),
      decoration: BoxDecoration(
        color:
            isDefault ? context.appThemeExtensions.colors.backButtonBg : null,
        border: isDefault
            ? Border.all(
                color: context.appThemeExtensions.colors.backButtonStroke,
              )
            : null,
        borderRadius: AppRadiusPalette.buttonRadius4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                "271727218472",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.textBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.appThemeExtensions.colors.textBlackColor,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              AppText(
                "06 SG 1480",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.borderGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              if (isDefault)
                AppText(
                  "Varsayılan",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )
              else
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: AppText(
                    "Varsayılan Yap",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.modalRedColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 13.w,
          ),
          AppText(
            "Serdar GÖLELİ",
            style: TextStyle(
              color: context.appThemeExtensions.colors.textBlackColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          AppText(
            "Konya, Selçuklu, Akademi Mah., Gürbulut Sokak, Konya Teknokent",
            style: TextStyle(
              color: context.appThemeExtensions.colors.textBlackColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 13.w,
          ),
          if (isDefault)
            Row(
              children: [
                AppButton(
                  onPressed: () {},
                  height: 30.w,
                  backgroundColor: context.appThemeExtensions.colors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadiusPalette.buttonRadius4,
                    side: BorderSide(
                      color: context.appThemeExtensions.colors.modalRedColor,
                    ),
                  ),
                  width: (context.width / 2) - 40.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        "Kaldır",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.modalRedColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      SvgPicture.asset(
                        Assets.svgs.removeIcon,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                AppButton(
                  onPressed: () {},
                  height: 30.w,
                  backgroundColor: context.appThemeExtensions.colors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadiusPalette.buttonRadius4,
                    side: BorderSide(
                      color: context.appThemeExtensions.colors.primary,
                    ),
                  ),
                  width: (context.width / 2) - 40.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        "Düzenle",
                        style: TextStyle(
                          color: context.appThemeExtensions.colors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      SvgPicture.asset(
                        Assets.svgs.editIcon,
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
