// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_cache_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppCacheSchemaAdapter extends TypeAdapter<AppCacheSchema> {
  @override
  final int typeId = 0;

  @override
  AppCacheSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppCacheSchema()
      ..theme = fields[0] as AppThemes?
      ..locale = fields[1] as String?
      ..accessToken = fields[2] as String?
      ..introduceView = fields[3] as bool?
      ..stationFilters = fields[4] as AppFilterSchema?;
  }

  @override
  void write(BinaryWriter writer, AppCacheSchema obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.theme)
      ..writeByte(1)
      ..write(obj.locale)
      ..writeByte(2)
      ..write(obj.accessToken)
      ..writeByte(3)
      ..write(obj.introduceView)
      ..writeByte(4)
      ..write(obj.stationFilters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppCacheSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
