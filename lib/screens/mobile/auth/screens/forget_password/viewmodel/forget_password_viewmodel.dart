import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/core/components/app_loading_area.dart';
import 'package:tripy_ev_stable/core/components/app_sms_component.dart';
import 'package:tripy_ev_stable/core/components/app_sms_success_widget.dart';
import 'package:tripy_ev_stable/core/extensions/string_extension.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/repositories/auth_repository.dart';
import 'package:tripy_ev_stable/routes/routes.dart';
import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';
import 'package:tripy_ev_stable/schemas/local/app_country_schema/app_country_schema.dart';
import 'package:tripy_ev_stable/services/firebase_notification_service.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';
import 'package:tripy_ev_stable/services/validator_service.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  AppCountrySchema? schema;
  bool isReset = false;
  ResponseSchema? resetRequest;
  @override
  void dispose() {
    DisposeAppValidate(
      labels: ["forgetPhone", "forgetPassword"],
    );
    super.dispose();
  }

  Future<void> reset() async {
    if (!isReset) {
      final result = await Inject.get<AuthRepository>().resetRequest(
        parameters: {
          "phone_number":
              ((schema?.callingCode ?? "90") + phoneController.text).Purify,
          "company_key": Config().get.companyKey,
        },
      );
      if (result?.status == 200) {
        resetRequest = result;
        isReset = true;
        notifyListeners();
      }
    } else {
      final smsResult = await router.modalPush(
        GetSmsCodeWidget(
          pinCount: 6,
          onVerified: (code) async {
            final smsVerifyResult =
                await Inject.get<AuthRepository>().resetVerify(
              parameters: {
                "access_id": resetRequest?.data["access_id"],
                "code": code,
                "new_password": newPasswordController.text.ClearSpaces,
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
            description: "Başarıyla logine aktarılıyorsunuz",
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
