// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';


import 'app_text.dart';

class AppAlert {
  static Future<T> show<T>({
    required String description,
    String? title,
    String? descrutiveCancelText,
    String? activeText,
    VoidCallback? whenCancelPressed,
    dynamic whenActivePressed,
    bool descrutiveEnabled = false,
    Key? key,
  }) async {
    return await router.modalPush(_AppAlertWidget(
      description: description,
      title: title,
      descrutiveCancelText: descrutiveCancelText,
      activeText: activeText,
      whenCancelPressed: whenCancelPressed,
      whenActivePressed: whenActivePressed,
      key: key,
      descrutiveEnabled: descrutiveEnabled,
    ));
  }
}

class _AppAlertWidget extends StatelessWidget {
  const _AppAlertWidget(
      {required this.description,
      this.title,
      this.descrutiveCancelText,
      this.activeText,
      this.whenCancelPressed,
      this.whenActivePressed,
      this.descrutiveEnabled = false,
      Key? key})
      : super(key: key);
  final String description;
  final String? title;
  final String? descrutiveCancelText;
  final String? activeText;
  final VoidCallback? whenCancelPressed;
  final dynamic whenActivePressed;
  final bool descrutiveEnabled;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: context.width,
        child: Padding(
          padding: context.initialHorizantalPadding,
          child: Material(
            borderRadius: AppRadiusPalette.borderRadius19,
            color: context.appThemeExtensions.colors.scaffoldBgColor,
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            "Tripy EV Charging",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: context
                                  .appThemeExtensions.colors.textBlackColor,
                            ),
                          ),
                          if (title != null)
                            AppText(
                              title!,
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -1.5,
                              ),
                            ),
                        ],
                      ),
                      SvgPicture.asset(
                        Assets.svgs.logo,
                        width: 80.w,
                        height: 60.w,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppText(
                    description,
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      if ((whenCancelPressed != null ||
                              descrutiveCancelText != null) ||
                          descrutiveEnabled)
                        AppButton(
                          onPressed: () {
                            if (whenCancelPressed != null) {
                              whenCancelPressed!();
                            }
                            router.pop();
                          },
                          width: 143.w,
                          backgroundColor: context
                              .appThemeExtensions.colors.modalRedColor
                              .withOpacity(0.1),
                          height: 38.w,
                          child: AppText(
                            descrutiveCancelText ?? "Hayır, vazgeç",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.modalRedColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      const Spacer(),
                      AppButton(
                        onPressed: () async {
                          if (whenActivePressed != null) {
                            await whenActivePressed!();
                          }
                          router.pop();
                        },
                        width: 143.w,
                        backgroundColor:
                            context.appThemeExtensions.colors.modalRedColor,
                        height: 38.w,
                        child: AppText(
                          activeText ?? "Evet,Çıkış Yap",
                          style: TextStyle(
                            color: context.appThemeExtensions.colors.whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
