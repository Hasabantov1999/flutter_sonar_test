import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_alert.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/saved_cards/viewmodel/saved_cards_viewmodel.dart';
class CardComponent extends ViewModelWidget<SavedCardsViewModel> {
  const CardComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context,SavedCardsViewModel viewModel) {
    return Material(
      color: context.appThemeExtensions.colors.whiteColor,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: context.initialHorizantalPadding,
          child: Column(
            children: [
              SizedBox(
                height: 13.w,
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 1,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    fillColor: WidgetStatePropertyAll(
                      context.appThemeExtensions.colors.primary,
                    ),
                    activeColor: context.appThemeExtensions.colors.primary,
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        "Garanti",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      AppText(
                        "1234**************12",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      AppAlert.show(
                        description:
                            "1234**************12 Numaralı Kartınızı Silmek İstediğinize Emin misiniz?",
                        title: "Kartı Sil",
                        descrutiveCancelText: "İptal Et",
                        descrutiveEnabled: true,
                        activeText: "Evet,sil",
                      );
                    },
                    icon: SvgPicture.asset(
                      Assets.svgs.removeIcon,
                      width: 24,
                      height: 24,
                    ),
                    style: IconButton.styleFrom(
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 13.w,
              ),
              Divider(
                color: context.appThemeExtensions.colors.dividerColor,
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
