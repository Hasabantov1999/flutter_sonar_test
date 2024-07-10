import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_rating_stars.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/components/app_top_alert.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class PassedChargesComponent extends StatelessWidget {
  const PassedChargesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isExpanded = ValueNotifier(false);
    return ValueListenableBuilder(
        valueListenable: isExpanded,
        builder: (context, expanded, child) {
          return SizedBox(
            height: !expanded ? 110.w : null,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.topCenter,
              curve: Curves.linearToEaseOut,
              reverseDuration: const Duration(milliseconds: 300),
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  InkWell(
                    onTap: () {
                      isExpanded.value = !isExpanded.value;
                    },
                    child: Padding(
                      padding: context.initialHorizantalPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                "Konya Teknokent 1 Nolu DC İstasyon",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  isExpanded.value = !isExpanded.value;
                                },
                                icon: Icon(
                                  expanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: context
                                      .appThemeExtensions.colors.iconColor,
                                ),
                              ),
                            ],
                          ),
                          AppText(
                            '''Emniyet, Bandırma Cad. No:14 C Blok No: 6, 06500 Yenimahalle/Ankara''',
                            maxLines: 2,
                            width: context.width,
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 13.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: context.initialHorizantalPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.w,
                        ),
                        AppText(
                          "Tarih",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 13.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 24.w,
                                  height: 24.w,
                                  decoration: BoxDecoration(
                                    color: context
                                        .appThemeExtensions.colors.borderGray,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: context.appThemeExtensions.colors
                                          .backButtonStroke,
                                      width: 3.w,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(
                                  "23 Nisan 2023 Çarşamba 10.43",
                                  style: TextStyle(
                                    color: context.appThemeExtensions.colors
                                        .textBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: SvgPicture.asset(
                                Assets.svgs.downLine,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 24.w,
                                  height: 24.w,
                                  decoration: BoxDecoration(
                                    color: context
                                        .appThemeExtensions.colors.primary,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: context.appThemeExtensions.colors
                                          .passiveColor,
                                      width: 3.w,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppText(
                                  "23 Nisan 2023 Çarşamba 10.43",
                                  style: TextStyle(
                                    color: context.appThemeExtensions.colors
                                        .textBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        SizedBox(
                          width: context.width,
                          child: Divider(
                            color:
                                context.appThemeExtensions.colors.dividerColor,
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        SizedBox(
                          width: context.width - 40.w,
                          child: Row(
                            children: [
                              AppText(
                                "Süre",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              AppText(
                                "1 saat 17 dk",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        SizedBox(
                          width: context.width,
                          child: Divider(
                            color:
                                context.appThemeExtensions.colors.dividerColor,
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        SizedBox(
                          width: context.width - 40.w,
                          child: Row(
                            children: [
                              AppText(
                                "Tüketilen Güç",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              AppText(
                                "123.22 KwH",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        SizedBox(
                          width: context.width,
                          child: Divider(
                            color:
                                context.appThemeExtensions.colors.dividerColor,
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        SizedBox(
                          width: context.width - 40.w,
                          child: Row(
                            children: [
                              AppText(
                                "Toplam Tutar",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              AppText(
                                "300.00 TL",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        SizedBox(
                          width: context.width,
                          child: Divider(
                            color:
                                context.appThemeExtensions.colors.dividerColor,
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        Container(
                          width: context.width - 40.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.w),
                          decoration: BoxDecoration(
                            color: context
                                .appThemeExtensions.colors.modalRedColor
                                .withOpacity(
                              0.15,
                            ),
                            borderRadius: AppRadiusPalette.buttonRadius4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Ödeme Alınamadı",
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.modalRedColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                              AppText(
                                '''Hesabınızın bakiyesi yetersiz olmasından dolayı ödeme alınamadı. Bakiyenizin yeterli olduğunu düşünüyorsanız, ödeme yapabilir veya müşteri temsilcimiz ile görüşebilirsiniz.''',
                                style: TextStyle(
                                  color: context
                                      .appThemeExtensions.colors.modalRedColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 13.w,
                        ),
                        AppButton(
                          width: context.width - 40.w,
                          onPressed: () {
                            router.modalPush(
                              const _Rate(),
                            );
                          },
                          backgroundColor:
                              context.appThemeExtensions.colors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                            side: BorderSide(
                              color: context.appThemeExtensions.colors.primary,
                            ),
                          ),
                          child: AppText(
                            "Değerlendir",
                            style: TextStyle(
                              color: context.appThemeExtensions.colors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _Rate extends StatelessWidget {
  const _Rate();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Material(
        borderRadius: AppRadiusPalette.buttonRadius4,
        color: context.appThemeExtensions.colors.scaffoldBgColor,
        child: Padding(
          padding: context.initialHorizantalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.w,
              ),
              AppText(
                "Değerlendir",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.textBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 13.w,
              ),
              Divider(
                color: context.appThemeExtensions.colors.dividerColor,
                height: 1,
              ),
              SizedBox(
                height: 13.w,
              ),
              SizedBox(
                height: 10.w,
              ),
              AppText(
                "Şarj istasyonu aracınızı şarj etme deneyiminizden ne kadar memnunsunuz?",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.textBlackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              AnimatedRatingStars(
                onChanged: (val) {},
                emptyColor: context.appThemeExtensions.colors.primary,
                filledColor: context.appThemeExtensions.colors.primary,
              ),
              SizedBox(
                height: 13.w,
              ),
              Divider(
                color: context.appThemeExtensions.colors.dividerColor,
                height: 1,
              ),
              SizedBox(
                height: 13.w,
              ),
              AppText(
                "İstasyonların konumu ve park alanı erişiminden ne kadar memnunsunuz?",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.textBlackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              AnimatedRatingStars(
                onChanged: (val) {},
                emptyColor: context.appThemeExtensions.colors.primary,
                filledColor: context.appThemeExtensions.colors.primary,
              ),
              SizedBox(
                height: 13.w,
              ),
              Divider(
                color: context.appThemeExtensions.colors.dividerColor,
                height: 1,
              ),
              SizedBox(
                height: 13.w,
              ),
              AppText(
                "Memnun olmadığınız veya iyileştirilmesi gerektiğini düşündüğünüz kısımları buradan belirtebilirsiniz.",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.textBlackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              AnimatedRatingStars(
                onChanged: (val) {},
                emptyColor: context.appThemeExtensions.colors.primary,
                filledColor: context.appThemeExtensions.colors.primary,
              ),
              SizedBox(
                height: 13.w,
              ),
              Divider(
                color: context.appThemeExtensions.colors.dividerColor,
                height: 1,
              ),
              SizedBox(
                height: 13.w,
              ),
              AppButton(
                onPressed: () async {
                  router.pop();
                  AppTopAlert.show(description: "Başarıyla gönderildi.");
                },
                child: AppText(
                  "Gönder",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.whiteTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 13.w + MediaQuery.paddingOf(context).bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
