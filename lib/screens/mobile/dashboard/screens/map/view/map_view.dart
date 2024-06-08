// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/core/components/app_square_button.dart';

import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/public/radius/app_radius_palette.dart';

import 'package:tripy_ev_stable/public/theme/theme_extensions/app_theme_extensions.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/map_top_components.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/styles/map_light_style.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/viewmodel/map_view_model.dart';
import 'package:tripy_ev_stable/services/location_service.dart';
import 'package:tripy_ev_stable/utils/safe_app_busy_utils.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MAP,
      onViewModelReady: (viewModel) {
        SafeAppBusy(
          () => viewModel.init(),
        );
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: viewModel.isInitialized
              ? Stack(
                  children: [
                    GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      markers: viewModel.markers,
                      initialCameraPosition: CameraPosition(
                        zoom: viewModel.zoomLevel,
                        target: LatLng(
                          viewModel.userPosition != null
                              ? viewModel.userPosition!.lat!
                              : LocationService.miaLocation.lat!,
                          viewModel.userPosition != null
                              ? viewModel.userPosition!.long!
                              : LocationService.miaLocation.long!,
                        ),
                      ),
                      onMapCreated: (controller) {
                        viewModel.mapController = controller;
                        viewModel.mapController.setMapStyle(
                          GoogleMapLightStyle,
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 120.w, right: 20.w),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppSquareButton(
                              onPressed: () {
                                
                              },
                              path: Assets.svgs.map.qr,
                              shape: RoundedRectangleBorder(
                                borderRadius: AppRadiusPalette.buttonRadius4,
                              ),
                              backgroundColor:
                                  context.appThemeExtensions.colors.whiteColor,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppSquareButton(
                              onPressed: () {
                                viewModel.getMyLocation();
                              },
                              path: Assets.svgs.map.location,
                              shape: RoundedRectangleBorder(
                                borderRadius: AppRadiusPalette.buttonRadius4,
                              ),
                              backgroundColor:
                                  context.appThemeExtensions.colors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const MapTopSearchBar(),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }
}
