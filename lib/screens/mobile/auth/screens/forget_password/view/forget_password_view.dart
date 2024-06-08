import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_phone_picker_field.dart';
import 'package:tripy_ev_stable/core/components/app_sms_component.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/auth/screens/forget_password/viewmodel/forget_password_viewmodel.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ForgetPasswordViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Padding(
                padding: context.initialHorizantalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.paddingOf(context).top + 20.h,
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
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                              ),
                            ),
                            AppText(
                              "Şifrenizi Sıfırlayın",
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
                          width: 103.w,
                          height: 76.w,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    const AppPhonePickerField(),
                    SizedBox(
                      height: 13.h,
                    ),
                    AppButton(
                      onPressed: () async {
                    await router.modalPush(
                          GetSmsCodeWidget(
                            onVerified: (code) {
                              return Future.error("");
                            },
                            phoneMask: "********96",
                            pinCount: 6,
                          ),
                        );
                      },
                      child: Text(
                        "Doğrulama Kodu Gönder",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.whiteTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            "Giriş Ekranına Dön",
                            onTap: () => router.pop(),
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  Assets.images.loginBottomImage.path,
                  width: context.width,
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
