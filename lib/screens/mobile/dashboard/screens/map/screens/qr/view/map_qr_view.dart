import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_label_text_field.dart';
import 'package:tripy_ev_stable/core/components/app_loading_bar.dart';
import 'package:tripy_ev_stable/core/components/app_text.dart';
import 'package:tripy_ev_stable/core/extensions/context_extensions.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/screens/qr/viewmodel/map_qr_view_model.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';
part '../pages/qr_page.dart';
part '../pages/text_page.dart';

class MapQrView extends StatelessWidget {
  const MapQrView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => MapQrViewModel(),
      builder: (context, viewModel, child) {
        return ValueListenableBuilder(
            valueListenable: viewModel.state,
            builder: (context, state, child) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  leadingWidth: 80.w,
                  leading: TextButton(
                    onPressed: () => router.pop(),
                    child: AppText(
                      "İptal",
                      style: TextStyle(
                        color: context.appThemeExtensions.colors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: AppText(
                    "QR Kodu Tara",
                    style: TextStyle(
                      color: context.appThemeExtensions.colors.textBlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    SizedBox(
                      height: 20.w,
                    ),
                    const AppText(
                      "İstasyonda bulunan QR kodunu taratarak şarj işlemini başlatabilirsiniz",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 13.w,
                    ),
                    Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: viewModel.stateBusy,
                          builder: (context, loading, child) {
                            if (loading) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    Assets.images.qrLoadingBg.path,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Lottie.asset(
                                              Assets.lotties.loading,
                                            ),
                                            const Positioned(
                                              bottom: 100,
                                              child: AppLoadingBar(),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }
                            return PageView(
                              controller: viewModel.pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                _QR(
                                  viewModel,
                                ),
                                _Text(
                                  viewModel,
                                ),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    TextButton(
                      onPressed: viewModel.changePage,
                      child: AppText(
                        state == CrossFadeState.showFirst
                            ? "İstasyon numarası kullanarak bağlayın"
                            : "QR okutarak bağlayın",
                        style: TextStyle(
                          color: context.appThemeExtensions.colors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.w + MediaQuery.paddingOf(context).bottom,
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
