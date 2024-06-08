import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';

extension AppStationMiniSchemaExtension on StationMiniSchema {
  Color get getStatusColor {
    if (status == "active") {
      return const Color(0xffFF671D);
    } else if (status == "passive") {
      return const Color(0xffE64848);
    } else if (status == "maintenance") {
      return const Color(0xff174CFF);
    } else {
      return const Color(0xffFF671D);
    }
  }

  String get getStatusString {
    if (status == "active") {
      return "Uygun";
    } else if (status == "passive") {
      return "Kullanımda";
    } else if (status == "maintenance") {
      return "Bakımda";
    } else {
      return "";
    }
  }

  String get getSocketType {
    return powerType ?? "";
  }
}
