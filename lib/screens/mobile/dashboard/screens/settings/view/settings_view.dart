import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_alert.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/routes/__init__.dart';
import 'package:tripy_ev_stable/routes/routes.dart';
import 'package:tripy_ev_stable/schemas/storage/app_cache_schema/app_cache_schema.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/account_settings/view/account_settings_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/app_settings/view/app_settings_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/billing_accounts/view/billing_accounts_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/help/view/help_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/notifications_permissions/view/notifications_permission_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/passed_charges/view/passed_charges_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/saved_cards/view/saved_cards_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/tariffs_and_packets/view/tariffs_and_packages_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/viewmodel/settings_view_model.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/viewmodel/dashboard_view_model.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 13.w + MediaQuery.paddingOf(context).top,
              ),
              Padding(
                padding: context.initialHorizantalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          "Serdar Göleli",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        AppText(
                          "serdar.goleli@miateknoloji.com",
                          style: TextStyle(
                            color: context
                                .appThemeExtensions.colors.textBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    AppText(
                      "+90 549 456 1996",
                      style: TextStyle(
                        color: context.appThemeExtensions.colors.textBlackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Divider(
                height: 1,
                color: context.appThemeExtensions.colors.dividerColor,
              ),
              SizedBox(
                height: 13.w,
              ),
              Padding(
                padding: context.initialHorizantalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: AppRadiusPalette.buttonRadius4,
                            color: context
                                .appThemeExtensions.colors.passiveColor
                                .withOpacity(0.4),
                          ),
                          child: SvgPicture.asset(
                            Assets.svgs.settings.settingsKwh,
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "KwH",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            AppText(
                              "200.0",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: AppRadiusPalette.buttonRadius4,
                            color: context
                                .appThemeExtensions.colors.passiveColor
                                .withOpacity(0.4),
                          ),
                          child: SvgPicture.asset(
                            Assets.svgs.settings.settingsProcess,
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "İşlem",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            AppText(
                              "20",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 44.w,
                          height: 44.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: AppRadiusPalette.buttonRadius4,
                            color: context
                                .appThemeExtensions.colors.passiveColor
                                .withOpacity(0.4),
                          ),
                          child: SvgPicture.asset(
                            Assets.svgs.settings.settingsDate,
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "NİSAN",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            AppText(
                              "2024",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13.w,
              ),
              Divider(
                height: 1,
                color: context.appThemeExtensions.colors.dividerColor,
              ),
              SizedBox(
                height: 20.w,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _ProfileWidget(
                        title: "Hesap Ayarlarım",
                        path: Assets.svgs.settings.settingsAccountSettings,
                        onTap: () {
                          router.push(
                            const Routes(
                              mobile: AccountSettingsView(),
                              path: '/profile/accountsettings',
                            ),
                            key: Dashboard.dashboardNavigator,
                          );
                        },
                      ),
                      _ProfileWidget(
                        title: "Fatura Hesaplarım",
                        path: Assets.svgs.settings.settingsBillingAccounts,
                        onTap: () {
                          router.push(
                            const Routes(
                              mobile: BillingAccountsView(),
                              path: '/profile/billingaccounts',
                            ),
                            key: Dashboard.dashboardNavigator,
                          );
                        },
                      ),
                      _ProfileWidget(
                        title: "Kayıtlı Kartlarım",
                        path: Assets.svgs.settings.settingsCards,
                        onTap: () {
                          router.push(
                            const Routes(
                              mobile: SavedCardsView(),
                              path: '/profile/savedcards',
                            ),
                            key: Dashboard.dashboardNavigator,
                          );
                        },
                      ),
                      _ProfileWidget(
                        title: "İşlemlerim",
                        path: Assets.svgs.settings.settingsHistory,
                        onTap: () {
                          router.push(
                            const Routes(
                              mobile: PassedChargesView(),
                              path: '/profile/passedprocess',
                            ),
                            key: Dashboard.dashboardNavigator,
                          );
                        },
                      ),
                      _ProfileWidget(
                        title: "Bildirim İzinlerim",
                        path: Assets.svgs.settings.settingsNotifications,
                        onTap: () {
                          router.push(
                            const Routes(
                              mobile: NotificationsPermissionView(),
                              path: '/profile/notificationsettings',
                            ),
                            key: Dashboard.dashboardNavigator,
                          );
                        },
                      ),
                      _ProfileWidget(
                        title: "Tarife ve Paketler",
                        path: Assets.svgs.settings.settingsPockets,
                        onTap: () {
                          router.push(
                            const Routes(
                              mobile: TariffsAndPackagesView(),
                              path: '/profile/tariffsandpackages',
                            ),
                            key: Dashboard.dashboardNavigator,
                          );
                        },
                      ),
                      _ProfileWidget(
                        title: "Uygulama Ayarları",
                        path: Assets.svgs.settings.settingsAppSettings,
                        onTap: () {
                          router.push(
                            const Routes(
                              mobile: AppSettingsView(),
                              path: '/profile/appsettings',
                            ),
                            key: Dashboard.dashboardNavigator,
                          );
                        },
                      ),
                      _ProfileWidget(
                        title: "Yardım",
                        path: Assets.svgs.settings.settingsHelp,
                        onTap: () {
                          router.push(
                            const Routes(
                              mobile: HelpView(),
                              path: '/profile/help',
                            ),
                            key: Dashboard.dashboardNavigator,
                          );
                        },
                      ),
                      _ProfileWidget(
                        title: "Çıkış Yap",
                        path: Assets.svgs.settings.settingsExit,
                        onTap: () async {
                          await AppAlert.show(
                            description:
                                "Uygulamadan çıkış yapmak istiyor musunuz?",
                            descrutiveEnabled: true,
                            title: "Hesabımdan Çıkış Yap",
                            activeText: "Evet,Çıkış Yap",
                            whenActivePressed: () async {
                              LocalCacheService().get.setModel(
                                    AppCacheSchema(),
                                  );
                              await Future.delayed(
                                const Duration(
                                  milliseconds: 300,
                                ),
                              );
                              router.go(
                                AppRoutes.LOGIN.route,
                              );
                            },
                          );
                        },
                        color: context.appThemeExtensions.colors.modalRedColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileWidget extends StatelessWidget {
  const _ProfileWidget({
    required this.title,
    this.color,
    required this.path,
    required this.onTap,
  });
  final String title;
  final Color? color;
  final String path;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Material(
        color: context.appThemeExtensions.colors.whiteColor,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: context.initialHorizantalPadding,
            child: Column(
              children: [
                SizedBox(
                  height: 13.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      path,
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    AppText(
                      title,
                      style: TextStyle(
                        color: color ??
                            context.appThemeExtensions.colors.textBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 13.w,
                ),
                Divider(
                  height: 1,
                  color: context.appThemeExtensions.colors.dividerColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
