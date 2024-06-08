import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/routes/routes.dart';
import 'package:tripy_ev_stable/screens/mobile/auth/screens/login/viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
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
                              "Tripy EV Charging’e",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                              ),
                            ),
                            AppText(
                              "Hoş Geldiniz",
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
                      height: 24.h,
                    ),
                    const AppLabelTextField(
                      label: "E-Posta Adresiniz",
                      hint: "abc@example.com",
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    const AppLabelTextField(
                      label: "Şifreniz",
                      password: true,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => router.push(
                          AppRoutes.FORGETPASSWORD.route,
                        ),
                        child: AppText(
                          "Şifremi Unuttum",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    AppButton(
                      onPressed: () => router.go(
                        AppRoutes.DASHBOARD.route,
                      ),
                      child: Text(
                        "GİRİŞ YAP",
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
                            "Henüz hesabınız yok mu?",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textPassiveColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppText(
                            " Hesap Oluştur",
                            onTap: () => router.push(
                              AppRoutes.REGISTER.route,
                            ),
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
