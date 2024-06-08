// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/repositories/location_repository.dart';
import 'package:tripy_ev_stable/repositories/transaction_repository.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';
import 'package:tripy_ev_stable/schemas/local/app_location_schema/app_location_schema.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/station_detail/view/app_station_detail_view.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/components/app_marker_widget.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/utils/get_status_color.dart';
import 'package:tripy_ev_stable/screens/mobile/dashboard/screens/map/utils/widget_to_marker_util.dart';

class MapViewModel extends BaseViewModel {
  AppLocationSchema? userPosition;
  late GoogleMapController mapController;
  final double zoomLevel = 16;
  ValueNotifier<bool> upbar = ValueNotifier(false);
  FocusNode searchBarFocusNode = FocusNode();
  void listenSearchBar() {
    if (searchBarFocusNode.hasFocus) {
      upbar.value = true;
    } else {
      upbar.value = false;
    }
  }

  List<StationMiniSchema> stations = [];
  Set<Marker> markers = {};
  bool isInitialized = false;
  Future<void> init() async {
    await getMyLocation(first: true);
    await loadStations();
  }

  void done() {
    isInitialized = true;
    notifyListeners();
    searchBarFocusNode.addListener(listenSearchBar);
  }

  @override
  void dispose() {
      searchBarFocusNode.removeListener(listenSearchBar);
    super.dispose();
  }

  Future<void> loadStations() async {
    stations = await Inject.get<TransactionRepository>().getAllStations();
    await loadMarkers();
    notifyListeners();
  }

  Future<void> loadMarkers() async {
    for (var station in stations) {
      markers.add(
        Marker(
          markerId: MarkerId(station.sId ?? ""),
          position: LatLng(
            station.coordinate?.latitude ?? 0,
            station.coordinate?.longitude ?? 0,
          ),
          onTap: () async {
            final result =
                await Inject.get<TransactionRepository>().getSingleStation(
              station.sId ?? "",
            );
            router.modalPush(
              DraggableScrollableSheet(
                minChildSize: 0.5,
                maxChildSize: 0.8,
                initialChildSize: 0.5,
                snapSizes: const [
                  0.5,
                  0.8,
                ],
                builder: (context, scrollController) {
                  return AppStationDetailView(
                    schema: result,
                    controller: scrollController,
                  );
                },
              ),
            );
          },
          icon: await AppMarkerWidget(
            color: station.getStatusColor,
          ).toMarker(
            logicalSize: const Size(110, 110),
            imageSize: const Size(110, 110),
          ),
        ),
      );
    }
  }

  Future<void> getMyLocation({bool first = false}) async {
    final myLocation = await Inject.get<LocationRepository>().getUserLocation();
    userPosition = myLocation;
    done();
    if (first) {
      Future.delayed(const Duration(seconds: 1), () {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(myLocation.lat!, myLocation.long!),
              zoom: zoomLevel,
            ),
          ),
        );
      });
    } else {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(myLocation.lat!, myLocation.long!),
            zoom: zoomLevel,
          ),
        ),
      );
    }
  }
}

MapViewModel MAP = MapViewModel();
