// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_mini_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationMiniSchema _$StationMiniSchemaFromJson(Map<String, dynamic> json) =>
    StationMiniSchema(
      sId: json['_id'] as String?,
      title: json['title'] as String?,
      locationType: json['location_type'] as String?,
      typeOfUse: json['type_of_use'] as String?,
      powerType: json['power_type'] as String?,
      status: json['status'] as String?,
      coordinate: json['coordinate'] == null
          ? null
          : CoordinateSchema.fromJson(
              json['coordinate'] as Map<String, dynamic>),
    )..activeSockets = (json['active_sockets'] as num?)?.toInt();

Map<String, dynamic> _$StationMiniSchemaToJson(StationMiniSchema instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'title': instance.title,
      'location_type': instance.locationType,
      'type_of_use': instance.typeOfUse,
      'power_type': instance.powerType,
      'status': instance.status,
      'coordinate': instance.coordinate,
      'active_sockets': instance.activeSockets,
    };

CoordinateSchema _$CoordinateSchemaFromJson(Map<String, dynamic> json) =>
    CoordinateSchema(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinateSchemaToJson(CoordinateSchema instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
