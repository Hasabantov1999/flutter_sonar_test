// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/utils/keyboard_utils.dart';

class AppDatePickerField extends StatelessWidget {
  const AppDatePickerField({
    super.key,
    this.validateLabel,
    this.controller,
    this.onChanged,
    this.initialDate,
  });
  final String? validateLabel;
  final TextEditingController? controller;
  final ValueChanged<DateTime>? onChanged;
  final DateTime? initialDate;
  @override
  Widget build(BuildContext context) {
    final TextEditingController ctrl = controller ?? TextEditingController();
    return GestureDetector(
      onTap: () async {
        print(initialDate);
        KeyboardClose();
        final res = await router.modalPush(
          _DateWidget(
            initialDate: initialDate,
          ),
        );
        if (res is DateTime) {
          print("burada");
          ctrl.text = DateFormat("dd/MM/yyyy").format(res);
          if (onChanged != null) {
            onChanged!(res);
          }
        }
      },
      behavior: HitTestBehavior.opaque,
      child: IgnorePointer(
        ignoring: true,
        child: AppLabelTextField(
          label: "Doğum Tarihiniz",
          hint: "Doğum Tarihiniz",
          validator: (p0) {
            if ((p0?.length ?? 0) < 10) {
              return "Lütfen doğru bir zaman dilimi giriniz";
            }
            return null;
          },
          controller: ctrl,
          validateLabel: validateLabel,
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
  const _DateWidget({this.initialDate});
  final DateTime? initialDate;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = initialDate ?? DateTime.now();
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
                    onPressed: () async {
                      router.pop(
                        result: dateTime,
                      );
                    },
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
                  initialDate: dateTime,
                  onChange: (datetime, index) {
                    dateTime = datetime;
                  },
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
