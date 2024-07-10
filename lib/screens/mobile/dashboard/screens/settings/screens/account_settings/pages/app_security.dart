// ignore_for_file: unused_element

part of '../view/account_settings_view.dart';

class _AppSecurity extends ViewModelWidget<AccountSettingsViewModel> {
  const _AppSecurity({super.key});

  @override
  Widget build(BuildContext context, AccountSettingsViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.initialHorizantalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 13.w,
            ),
            AppText(
              "Şifrenizi Değiştirin",
              style: TextStyle(
                color: context.appThemeExtensions.colors.textBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 13.w,
            ),
            AppLabelTextField(
              label: "Mevcut Şifreniz",
              password: true,
              controller: TextEditingController(
                text: "12345678",
              ),
            ),
            SizedBox(
              height: 13.w,
            ),
            AppLabelTextField(
              label: "Yeni Şifreniz",
              password: true,
              controller: TextEditingController(
                text: "12345678",
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            AppLabelTextField(
              label: "Yeni Şifreniz Tekrar",
              password: true,
              controller: TextEditingController(
                text: "12345678",
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
            ),
            SizedBox(
              height: 40.w,
            ),
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 15.w,
              ),
              decoration: BoxDecoration(
                borderRadius: AppRadiusPalette.buttonRadius4,
                color:
                    context.appThemeExtensions.colors.modalRedColor.withOpacity(
                  0.15,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Hesabımı Kapat",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.modalRedColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 7.w,
                  ),
                  AppText(
                    "Bu bölümden hesabınızı kapatabilir, dilerseniz daha sonra çağrı merkezine ulaşarak hesabınızı tekrar aktive edebilirsiniz",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.modalRedColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  AppButton(
                    onPressed: () {},
                    backgroundColor:
                        context.appThemeExtensions.colors.modalRedColor,
                    child: AppText(
                      "Hesabımı Kapat",
                      style: TextStyle(
                        color: context.appThemeExtensions.colors.whiteTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
