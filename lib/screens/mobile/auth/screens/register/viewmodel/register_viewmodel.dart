import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/core/components/app_loading_area.dart';
import 'package:tripy_ev_stable/core/components/app_sms_component.dart';
import 'package:tripy_ev_stable/core/components/app_sms_success_widget.dart';
import 'package:tripy_ev_stable/core/extensions/date_extension.dart';
import 'package:tripy_ev_stable/core/extensions/string_extension.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/repositories/auth_repository.dart';
import 'package:tripy_ev_stable/routes/routes.dart';
import 'package:tripy_ev_stable/schemas/local/app_country_schema/app_country_schema.dart';
import 'package:tripy_ev_stable/services/firebase_notification_service.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';
import 'package:tripy_ev_stable/services/validator_service.dart';

class RegisterViewModel extends BaseViewModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  AppCountrySchema? phoneSchema;
  final TextEditingController tcknController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> contractChanged = ValueNotifier(false);
  @override
  void dispose() {
    DisposeAppValidate(
      labels: [
        "registerName",
        "registerSurname",
        "registerBirthDate",
        "registerPhone",
        "registerTckn",
        "registerEmail",
        "registerPassword",
      ],
    );
    super.dispose();
  }

  Future<void> register() async {
    final result = await Inject.get<AuthRepository>().register(
      parameters: {
        "email": emailController.text.ClearSpaces,
        "password": passwordController.text.ClearSpaces,
        "name": nameController.text.ClearSpaces,
        "surname": surnameController.text.ClearSpaces,
        "country_code": phoneSchema?.countryCode,
        "identity_number": tcknController.text.ClearSpaces,
        "birth_date":
            birthDateController.text.ConvertStringToDate.ConvertBackendDate,
        "company_key": Config().get.companyKey,
        "fcm_token": FirebaseNotificationService().fcmToken,
        "captcha": null
      },
    );
    if (result?.status == 201) {
      final smsResult = await router.modalPush(
        GetSmsCodeWidget(
          pinCount: 6,
          onVerified: (code) async {
            final smsVerifyResult =
                await Inject.get<AuthRepository>().loginVerify(
              parameters: {
                "access_id": result?.data["access_id"],
                "code": code,
              },
            );
            if (smsVerifyResult?.status == 201) {
              LocalCacheService().get.model()
                ..accessToken = smsVerifyResult?.data["access_token"]
                ..save();
              return true;
            } else {
              return false;
            }
          },
        ),
      );
      if (smsResult != null && smsResult is bool && smsResult) {
        setAppBusy(
          true,
          child: const AppSuccessWidget(
            title: "Kod Doğrulama Başarılı",
            description: "Başarıyla anasayfaya aktarılıyorsunuz",
          ),
        );
        await Future.delayed(const Duration(seconds: 2));
        setAppBusy(false);
        router.go(
          AppRoutes.DASHBOARD.route,
        );
      }
    }
  }
}
