// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_country_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppCountrySchema _$AppCountrySchemaFromJson(Map<String, dynamic> json) =>
    AppCountrySchema(
      callingCode: json['calling_code'] as String?,
      countryCode: json['country_code'] as String?,
      flag: json['flag'] as String?,
      flags: json['flags'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AppCountrySchemaToJson(AppCountrySchema instance) =>
    <String, dynamic>{
      'country_code': instance.countryCode,
      'name': instance.name,
      'calling_code': instance.callingCode,
      'flag': instance.flag,
      'flags': instance.flags,
    };
