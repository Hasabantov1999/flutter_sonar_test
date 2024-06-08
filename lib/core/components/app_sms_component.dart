import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'package:sms_autofill/sms_autofill.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_loading_area.dart';
import 'package:tripy_ev_stable/core/components/app_rich_text.dart';
import 'package:tripy_ev_stable/core/components/app_sms_success_widget.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

import 'app_text.dart';

class GetSmsCodeWidget extends StatefulWidget {
  const GetSmsCodeWidget({
    super.key,
    this.sendAgain,
    this.pinCount = 4,
    this.phoneMask,
    required this.onVerified,
  });

  final VoidCallback? sendAgain;
  final int pinCount;
  final Future Function(String code) onVerified;
  final String? phoneMask;
  @override
  State<GetSmsCodeWidget> createState() => _GetSmsCodeWidgetState();
}

class _GetSmsCodeWidgetState extends State<GetSmsCodeWidget> with CodeAutoFill {
  late DateTime startDateTime;
  late Timer counterTimer;
  ValueNotifier<int> seconds = ValueNotifier(180);
  ValueNotifier<bool> buttonAsync = ValueNotifier(false);
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    startDateTime = DateTime.now();
    SmsAutoFill().getAppSignature.then((value) {
      DeveloperLog.instance.logSuccess("SMS HASH:$value");
    });
    startTimer();
    controller.addListener(
      () {
        if (controller.text != code) {
          code = controller.text;
        }
      },
    );
    listenForCode();

    super.initState();
  }

  @override
  void codeUpdated() {
    if (controller.text != code) {
      controller.value = TextEditingValue(text: code ?? '');
      if (mounted) setState(() {});
    }
  }

  void startTimer() {
    counterTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value != 0) {
        seconds.value =
            180 - DateTime.now().difference(startDateTime).inSeconds;
      }
    });
  }

  void reset() {
    startDateTime = DateTime.now();
    seconds.value = 180;
  }

  @override
  void dispose() {
    counterTimer.cancel();
    unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: widget.pinCount > 4 ? 45.w : 60.w,
      height: widget.pinCount > 4 ? 45.w : 64.w,
      textStyle: GoogleFonts.poppins(
        fontSize: widget.pinCount > 3 ? 14 : 20,
        color: context.appThemeExtensions.colors.textBlackColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: context.appThemeExtensions.colors.scaffoldBgColor,
        border: Border(
          bottom: BorderSide(
            color: context.appThemeExtensions.colors.primary,
            width: 2.w,
          ),
        ),
      ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 1.5,
        height: 30,
        margin: const EdgeInsets.only(bottom: 10),
        // margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          // color: const Color.fromRGBO(137, 146, 160, 1),
          // borderRadius: BorderRadius.circular(8),
          border: Border(
            left: BorderSide(
              color: context.appThemeExtensions.colors.primary,
            ),
          ),
        ),
      ),
    );
    return SizedBox(
      height: context.contextModalHeight,
      child: Material(
        color: context.appThemeExtensions.colors.scaffoldBgColor,
        borderRadius: AppRadiusPalette.modalRadius,
        child: Padding(
          padding: context.initialHorizantalPadding,
          child: Column(
            children: [
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
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
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
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                        ),
                      ),
                      AppText(
                        "Şifrenizi Sıfırlayın",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1.5,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    Assets.svgs.logo,
                    width: 103.w,
                    height: 76.w,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ValueListenableBuilder(
                  valueListenable: seconds,
                  builder: (context, remainingSeconds, child) {
                    int minutes = remainingSeconds ~/ 60;
                    int remainingSecondsInMinute = remainingSeconds % 60;
                    return AppRichText(
                      jsonKey: "sms_interpolation",
                      activeStyle: TextStyle(
                        color: context.appThemeExtensions.colors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      passiveStyle: TextStyle(
                        color: context.appThemeExtensions.colors.textBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      filter: {
                        "@": "$minutes:$remainingSecondsInMinute",
                        "#": widget.phoneMask ?? "********96",
                      },
                    );
                  }),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                key: formKey,
                child: Pinput(
                  controller: controller,
                  length: widget.pinCount,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 16),
                  focusedPinTheme: defaultPinTheme,
                  showCursor: true,
                  cursor: cursor,
                  validator: (value) {
                    if (value?.length != widget.pinCount) {
                      return "Lütfen ${widget.pinCount} hane giriniz";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              AppButton(
                onPressed: () async {
                  setAppBusy(
                    true,
                    child: const AppSuccessWidget(
                      title: "Kod Doğrulama Başarılı",
                      description:
                          "Yeni şifre oluşturma ekranına yönlendiriliyorsunuz. Lütfen Bekleyin.",
                    ),
                    barrierDismissible: true,
                  );
                },
                child: Text(
                  "Kodu Doğrula",
                  style: TextStyle(
                    color: context.appThemeExtensions.colors.whiteTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ValueListenableBuilder(
                valueListenable: seconds,
                builder: (context, remainingSeconds, child) {
                  int minutes = remainingSeconds ~/ 60;
                  int remainingSecondsInMinute = remainingSeconds % 60;
                  return Material(
                    color: Colors.transparent,
                    child: remainingSeconds != 0
                        ? Text(
                            'Kodu Yeniden Gönder ($minutes:$remainingSecondsInMinute)',
                            style: TextStyle(
                              fontSize: 14,
                              color: context
                                  .appThemeExtensions.colors.textPassiveColor,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              "Tekrar Gönder",
                              style: TextStyle(
                                fontSize: 14,
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {
                              reset();
                              if (widget.sendAgain != null) {
                                widget.sendAgain!();
                              }
                            },
                          ),
                  );
                },
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
