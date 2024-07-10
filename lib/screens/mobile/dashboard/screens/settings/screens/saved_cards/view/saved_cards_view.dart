import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_dashboard_appbar.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/routes/__init__.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/saved_cards/components/card_component.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/saved_cards/screens/add_card/view/add_card_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/settings/screens/saved_cards/viewmodel/saved_cards_viewmodel.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/viewmodel/dashboard_view_model.dart';

class SavedCardsView extends StatelessWidget {
  const SavedCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SavedCardsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          primary: false,
          body: Column(
            children: [
              const AppDashboardAppBar(
                title: "Kayıtlı Kartlar",
              ),
              SizedBox(
                height: 30.w,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: context.height * 0.6,
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      CardComponent(),
                    ],
                  ),
                ),
              ),
              Material(
                color: context.appThemeExtensions.colors.whiteColor,
                child: InkWell(
                  onTap: () => router.push(
                    const Routes(
                      mobile: AddCardView(),
                      path: "/profile/saved_cards/add",
                    ),
                    key: Dashboard.dashboardNavigator,
                  ),
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
                              Assets.svgs.addCard,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            AppText(
                              "Kart Ekle",
                              style: TextStyle(
                                color: context
                                    .appThemeExtensions.colors.textBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 13.w,
                        ),
                        Divider(
                          color: context.appThemeExtensions.colors.dividerColor,
                          height: 1,
                        ),
                      ],
                    ),
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
