part of '../view/add_billing_account_view.dart';

class _IndividualBillingPage
    extends ViewModelWidget<AddBillingAccountViewModel> {
  const _IndividualBillingPage();

  @override
  Widget build(BuildContext context, AddBillingAccountViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.initialHorizantalPadding,
        child: Column(
          children: [
            SizedBox(
              height: 20.w,
            ),
            const AppLabelTextField(
              label: "Adınız Soyadınız",
            ),
            SizedBox(
              height: 13.w,
            ),
            const AppLabelTextField(
              label: "E-Posta Adresiniz",
            ),
            SizedBox(
              height: 13.w,
            ),
            const AppLabelTextField(
              label: "TCKN veya Pasaport Numarası",
            ),
            SizedBox(
              height: 13.w,
            ),
            const AppPhonePickerField(),
            SizedBox(
              height: 13.w,
            ),
            const AppCityStatePicker(),
            SizedBox(
              height: 13.w,
            ),
            const AppLabelTextField(
              label: "Plaka",
            ),
            SizedBox(
              height: 13.w,
            ),
            const AppLabelTextField(
              label: "Adres",
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 4,
            ),
            SizedBox(
              height: 13.w,
            ),
            AppButton(
              onPressed: () {},
              child: AppText(
                "Kaydet",
                style: TextStyle(
                  color: context.appThemeExtensions.colors.whiteTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
