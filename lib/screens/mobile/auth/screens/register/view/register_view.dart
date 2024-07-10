import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_button.dart';
import 'package:tripy_ev_stable/core/components/app_date_picker_field.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_phone_picker_field.dart';
import 'package:tripy_ev_stable/core/components/app_rich_text.dart';
import 'package:tripy_ev_stable/core/components/app_switch.dart';
import 'package:tripy_ev_stable/core/components/app_tckn_or_passport_field.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/core/extensions/date_extension.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/auth/screens/register/viewmodel/register_viewmodel.dart';
import 'package:tripy_ev_stable/services/validator_service.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: context.initialHorizantalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.paddingOf(context).top + 20.h,
                  ),
                  AppText(
                    "Hoş Geldiniz",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  AppText(
                    "Kişisel hesabınızı oluşturarak uygulamayı  kullanmaya başlayabilirsiniz",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppLabelTextField(
                    label: "Adınız",
                    hint: "John",
                    validateLabel: "registerName",
                    controller: viewModel.nameController,
                    validator: (val) {
                      if ((val?.length ?? 0) < 1) {
                        return "Lütfen Geçerli bir isim giriniz";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  AppLabelTextField(
                    label: "Soyadınız",
                    hint: "Doe",
                    validateLabel: "registerSurname",
                    controller: viewModel.surnameController,
                    validator: (val) {
                      if ((val?.length ?? 0) < 1) {
                        return "Lütfen Geçerli bir isim giriniz";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  AppDatePickerField(
                    validateLabel: "registerBirthDate",
                    controller: viewModel.birthDateController,
                    initialDate:
                        viewModel.birthDateController.text.ConvertStringToDate,
                    onChanged: (val) {
                      viewModel.notifyListeners();
                    },
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  AppPhonePickerField(
                    validateLabel: "registerPhone",
                    controller: viewModel.phoneController,
                    onChanged: (schema) {
                      viewModel.phoneSchema = schema;
                    },
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  AppTcknOrPassportNumberField(
                    controller: viewModel.tcknController,
                    validateLabel: "registerTckn",
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  AppLabelTextField(
                    controller: viewModel.emailController,
                    label: "E-Posta Adresiniz",
                    validateLabel: "registerEmail",
                    hint: "abc@example.com",
                    validator: (val) {
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (emailRegex.hasMatch(val ?? "")) {
                        return null;
                      }
                      return "Lütfen doğru bir e-posta giriniz";
                    },
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  AppLabelTextField(
                    label: "Şifreniz",
                    validateLabel: "registerPassword",
                    controller: viewModel.passwordController,
                    password: true,
                    validator: (val) {
                      if ((val?.length ?? 0) < 6) {
                        return "Minumum 6 hane olmalıdır";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    children: [
                      AppSwitch(
                        onChanged: (val) {
                          viewModel.contractChanged.value = val;
                        },
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: AppRichText(
                          jsonKey: "register_interpolation",
                          recognizers: const {},
                          activeStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              color: context
                                  .appThemeExtensions.colors.textBlackColor),
                          passiveStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: context
                                .appThemeExtensions.colors.textPassiveColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  ValueListenableBuilder(
                      valueListenable: viewModel.contractChanged,
                      builder: (context, contract, child) {
                        return ValueListenableBuilder(
                            valueListenable: AppValidateForm,
                            builder: (context, validate, child) {
                              return AppButton(
                                onPressed: (!contract || !validate)
                                    ? null
                                    : () async {},
                                child: AppText(
                                  "Hesap Oluştur",
                                  style: TextStyle(
                                    color: context.appThemeExtensions.colors
                                        .whiteTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            });
                      }),
                  SizedBox(
                    height: 13.h,
                  ),
                  SafeArea(
                    top: false,
                    left: false,
                    right: false,
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            "Zaten hesabınız var mı? ",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textPassiveColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppText(
                            "Giriş Yap",
                            onTap: () {
                              router.pop();
                            },
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
