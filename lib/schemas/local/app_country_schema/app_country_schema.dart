import 'package:json_annotation/json_annotation.dart';
part "app_country_schema.g.dart";

@JsonSerializable()
class AppCountrySchema {
  @JsonKey(name: "country_code")
  final String? countryCode;
  final String? name;
  @JsonKey(name: "calling_code")
  final String? callingCode;
  final String? flag;
  final String? flags;
  AppCountrySchema({
    required this.callingCode,
    required this.countryCode,
    required this.flag,
    required this.flags,
    required this.name,
  });
  factory AppCountrySchema.fromJson(Map<String, dynamic> json) =>
      _$AppCountrySchemaFromJson(json);

  Map<String, dynamic> toJson() => _$AppCountrySchemaToJson(this);
}
