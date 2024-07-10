import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/core/components/app_switch.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/notifications_permissions/viewmodel/notifications_permissions_view_model.dart';

class NotificationsPermissionView extends StatelessWidget {
  const NotificationsPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => NotificationsPermissionsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: context.initialHorizantalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppDashboardAppBar(
                    title: "Bildirim İzinlerim",
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                  AppText(
                    "Cihaz Bildirim Ayarları",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Divider(
                    height: 1,
                    color: context.appThemeExtensions.colors.dividerColor,
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "Bildirimlere İzin ver",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const AppSwitch(),
                    ],
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                  AppText(
                    "Bildirim Seçenekleri",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Divider(
                    color: context.appThemeExtensions.colors.dividerColor,
                    height: 1,
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "Tüm Bildirimleri Aç",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const AppSwitch(),
                    ],
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Divider(
                    height: 1,
                    color: context.appThemeExtensions.colors.dividerColor,
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            "Şarj İşlemi Ön Bilgilendirme",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          AppText(
                            "Batarya %80’i dolunca  yapılacak bilgilendirme",
                            style: TextStyle(
                              color: context
                                  .appThemeExtensions.colors.textPassiveColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const AppSwitch(),
                    ],
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Divider(
                    height: 1,
                    color: context.appThemeExtensions.colors.dividerColor,
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "Şarj işlemi sonlandığında",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const AppSwitch(),
                    ],
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Divider(
                    height: 1,
                    color: context.appThemeExtensions.colors.dividerColor,
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "Şarj İşlemi durduğunda ",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const AppSwitch(),
                    ],
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Divider(
                    height: 1,
                    color: context.appThemeExtensions.colors.dividerColor,
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        "Yeni Kampanya veya Tarifelerde",
                        style: TextStyle(
                          color:
                              context.appThemeExtensions.colors.textBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const AppSwitch(),
                    ],
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                  Divider(
                    height: 1,
                    color: context.appThemeExtensions.colors.dividerColor,
                  ),
                  SizedBox(
                    height: 13.w,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
