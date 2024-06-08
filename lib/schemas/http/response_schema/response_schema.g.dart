// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSchema _$ResponseSchemaFromJson(Map<String, dynamic> json) =>
    ResponseSchema(
      data: json['data'],
      status: (json['status'] as num?)?.toInt(),
      code: json['code'] as String?,
      message: json['message'],
      description: json['description'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ResponseSchemaToJson(ResponseSchema instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'description': instance.description,
      'version': instance.version,
    };
