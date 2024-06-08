// ignore_for_file: non_constant_identifier_names

import 'package:geolocator/geolocator.dart';
import 'package:tripy_ev_stable/core/components/app_alert.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/repositories/location_repository.dart';
import 'package:tripy_ev_stable/routes/routes.dart';

Future<bool> LocationGuards() async {
  final locationService =
      await Inject.get<LocationRepository>().locationServiceEnabled();
  final locationPermssion =
      await Inject.get<LocationRepository>().checkLocationPermission();
  if (locationService && locationPermssion) return true;
  if (!locationService) {
    await AppAlert.show(
      description:
          "Uygulamayı kullanabilmeniz için konum servislerini açmanız gerekmektedir.",
      descrutiveEnabled: true,
      title: "Konum Servisi",
      activeText: "Konum Servisini Aç",
      whenActivePressed: () {
        Geolocator.openLocationSettings();
      },
    );
    if (await Inject.get<LocationRepository>().locationServiceEnabled()) {
      return true;
    } else {
      router.go(AppRoutes.LOGIN.route);
      return false;
    }
  }
  if (!locationPermssion) {
    await AppAlert.show(
      description:
          "Uygulamayı kullanabilmeniz için konuma izin vermeniz gerekmektedir.",
      descrutiveEnabled: true,
      title: "Konum İzini",
      activeText: "Konum İzni Ver",
      whenActivePressed: () async {
        await Inject.get<LocationRepository>().askLocationPermission();
      },
    );
    if (await Inject.get<LocationRepository>().checkLocationPermission()) {
      return true;
    } else {
      router.go(AppRoutes.LOGIN.route);
      return false;
    }
  }
  return false;
}
