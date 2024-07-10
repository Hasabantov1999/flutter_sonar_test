// ignore_for_file: unused_element

part of '../view/account_settings_view.dart';

class _PersonalInformations extends ViewModelWidget<AccountSettingsViewModel> {
  const _PersonalInformations({super.key});

  @override
  Widget build(BuildContext context, AccountSettingsViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.initialHorizantalPadding,
        child: Column(
          children: [
            SizedBox(
              height: 13.w,
            ),
            AppLabelTextField(
              label: "Adınız",
              controller: TextEditingController(
                text: "Serdar",
              ),
            ),
            SizedBox(
              height: 13.w,
            ),
            AppLabelTextField(
              label: "Soyadınız",
              controller: TextEditingController(
                text: "GÖLELİ",
              ),
            ),
            SizedBox(
              height: 13.w,
            ),
            const AppDatePickerField(),
            SizedBox(
              height: 13.h,
            ),
            const AppPhonePickerField(),
            SizedBox(
              height: 13.w,
            ),
            AppLabelTextField(
              label: "E-Posta Adresiniz",
              controller: TextEditingController(
                text: "serdar.goleli@miateknoloji.com",
              ),
            ),
            SizedBox(
              height: 30.w,
            ),
            AppButton(
              onPressed: () {},
              child: AppText(
                "Kaydet",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.whiteTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
