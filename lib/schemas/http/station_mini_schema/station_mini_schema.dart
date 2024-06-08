
import 'package:json_annotation/json_annotation.dart';
part "station_mini_schema.g.dart";

@JsonSerializable()
class StationMiniSchema {
  @JsonKey(name: "_id")
  String? sId;
  String? title;
  @JsonKey(name: "location_type")
  String? locationType;
  @JsonKey(name: "type_of_use")
  String? typeOfUse;
  @JsonKey(name: "power_type")
  String? powerType;
  String? status;
  CoordinateSchema? coordinate;
  @JsonKey(name: "active_sockets")
  int? activeSockets;

  StationMiniSchema(
      {this.sId,
      this.title,
      this.locationType,
      this.typeOfUse,
      this.powerType,
      this.status,
      this.coordinate});
  factory StationMiniSchema.fromJson(Map<String, dynamic> json) =>
      _$StationMiniSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$StationMiniSchemaToJson(this);
}

@JsonSerializable()
class CoordinateSchema {
  double? latitude;
  double? longitude;

  CoordinateSchema({this.latitude, this.longitude});
  factory CoordinateSchema.fromJson(Map<String, dynamic> json) =>
      _$CoordinateSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateSchemaToJson(this);
}
