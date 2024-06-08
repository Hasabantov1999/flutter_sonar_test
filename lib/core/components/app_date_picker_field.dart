import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';

class AppDatePickerField extends StatelessWidget {
  const AppDatePickerField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        final res = await router.modalPush(
          const _DateWidget(),
        );
        if (res is DateTime) {}
      },
      behavior: HitTestBehavior.opaque,
      child: IgnorePointer(
        ignoring: true,
        child: AppLabelTextField(
          label: "Doğum Tarihiniz",
          hint: "Doğum Tarihiniz",
          suffix: Icon(
            Icons.date_range_outlined,
            color: context.appThemeExtensions.colors.textBlackColor,
          ),
        ),
      ),
    );
  }
}

class _DateWidget extends StatelessWidget {
  const _DateWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.contextHalfModalHeight,
      child: Material(
        color: context.appThemeExtensions.colors.whiteColor,
        borderRadius: AppRadiusPalette.modalRadius,
        child: Padding(
          padding: context.initialHorizantalPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 13.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    onPressed: () async {
                      router.pop();
                    },
                    width: 80.w,
                    backgroundColor: Colors.transparent,
                    child: AppText(
                      "VAZGEÇ",
                      style: TextStyle(
                        color: context.appThemeExtensions.colors.primary,
                      ),
                    ),
                  ),
                  AppButton(
                    onPressed: () async {},
                    width: 80.w,
                    backgroundColor: Colors.transparent,
                    child: AppText(
                      "ONAYLA",
                      style: TextStyle(
                        color: context.appThemeExtensions.colors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: DatePickerWidget(
                  looping: true,
                  locale: DateTimePickerLocale.tr,
                  pickerTheme: DateTimePickerTheme(
                    dividerColor: context.appThemeExtensions.colors.primary,
                    itemTextStyle: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.paddingOf(context).bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
