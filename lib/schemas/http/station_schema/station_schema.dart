import 'package:json_annotation/json_annotation.dart';
import 'package:tripy_ev_stable/schemas/http/station_mini_schema/station_mini_schema.dart';

part 'station_schema.g.dart';

@JsonSerializable()
class StationSchema {
  @JsonKey(name: "_id")
  String? sId;
  @JsonKey(name: "company_id")
  String? companyId;
  String? id;
  String? title;
  String? address;
  @JsonKey(name: "adress_recipe")
  String? addressRecipe;
  String? photo;
  @JsonKey(name: "type_of_use")
  String? typeOfUse;
  String? model;
  @JsonKey(name: "location_type")
  String? locationType;
  @JsonKey(name: "power_type")
  String? powerType;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  String? status;
  CoordinateSchema? coordinate;
  FacilitySchema? facility;
  @JsonKey(name: "working_hours")
  WorkingHoursSchema? workingHours;
  ServiceSchema? service;
  List<SocketsSchema>? sockets;
  @JsonKey(name: "wh_price")
  num? whPrice;
  @JsonKey(name: "parking_fee")
  num? parkingFee;
  @JsonKey(name: "reservation_fee")
  double? reservationFee;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  StationSchema(
      {this.sId,
      this.companyId,
      this.id,
      this.title,
      this.address,
      this.addressRecipe,
      this.photo,
      this.typeOfUse,
      this.model,
      this.locationType,
      this.powerType,
      this.phoneNumber,
      this.status,
      this.coordinate,
      this.facility,
      this.workingHours,
      this.service,
      this.sockets,
      this.whPrice,
      this.parkingFee,
      this.reservationFee,
      this.createdAt,
      this.updatedAt});
  factory StationSchema.fromJson(Map<String, dynamic> json) =>
      _$StationSchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StationSchemaToJson(this);
}

@JsonSerializable()
class FacilitySchema {
  bool? wifi;
  bool? phone;
  bool? cafe;
  bool? avm;

  FacilitySchema({
    this.wifi,
    this.phone,
    this.cafe,
    this.avm,
  });
  factory FacilitySchema.fromJson(Map<String, dynamic> json) =>
      _$FacilitySchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FacilitySchemaToJson(this);
}

@JsonSerializable()
class WorkingHoursSchema {
  @JsonKey(name: "monday_start")
  String? mondayStart;
  @JsonKey(name: "monday_end")
  String? mondayEnd;
  @JsonKey(name: "tuesday_start")
  String? tuesdayStart;
  @JsonKey(name: "tuesday_end")
  String? tuesdayEnd;
  @JsonKey(name: "wednesday_start")
  String? wednesdayStart;
  @JsonKey(name: "wednesday_end")
  String? wednesdayEnd;
  @JsonKey(name: "thursday_start")
  String? thursdayStart;
  @JsonKey(name: "thursday_end")
  String? thursdayEnd;
  @JsonKey(name: "friday_start")
  String? fridayStart;
  @JsonKey(name: "friday_end")
  String? fridayEnd;
  @JsonKey(name: "saturday_start")
  String? saturdayStart;
  @JsonKey(name: "saturday_end")
  String? saturdayEnd;
  @JsonKey(name: "sunday_start")
  String? sundayStart;
  @JsonKey(name: "sunday_end")
  String? sundayEnd;

  WorkingHoursSchema({
    this.mondayStart,
    this.mondayEnd,
    this.tuesdayStart,
    this.tuesdayEnd,
    this.wednesdayStart,
    this.wednesdayEnd,
    this.thursdayStart,
    this.thursdayEnd,
    this.fridayStart,
    this.fridayEnd,
    this.saturdayStart,
    this.saturdayEnd,
    this.sundayStart,
    this.sundayEnd,
  });

  factory WorkingHoursSchema.fromJson(Map<String, dynamic> json) =>
      _$WorkingHoursSchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WorkingHoursSchemaToJson(this);
}

@JsonSerializable()
class ServiceSchema {
  String? chargeService;
  bool? reservation;
  @JsonKey(name: "park_area")
  num? parkArea;
  @JsonKey(name: "free_park")
  bool? freePark;

  ServiceSchema({
    this.chargeService,
    this.reservation,
    this.parkArea,
    this.freePark,
  });
  factory ServiceSchema.fromJson(Map<String, dynamic> json) =>
      _$ServiceSchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ServiceSchemaToJson(this);
}

@JsonSerializable()
class SocketsSchema {
  num? id;
  @JsonKey(name: "socket_type")
  String? socketType;
  num? kva;
  num? amp;
  String? status;
  @JsonKey(name: "socket_qr")
  String? socketQr;
  SocketsSchema({this.id, this.socketType, this.kva, this.amp, this.status});
  factory SocketsSchema.fromJson(Map<String, dynamic> json) =>
      _$SocketsSchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SocketsSchemaToJson(this);
}
