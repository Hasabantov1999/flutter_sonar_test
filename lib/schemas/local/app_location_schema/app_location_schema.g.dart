// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_location_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppLocationSchemaAdapter extends TypeAdapter<AppLocationSchema> {
  @override
  final int typeId = 8;

  @override
  AppLocationSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppLocationSchema(
      lat: fields[0] as double?,
      long: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, AppLocationSchema obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLocationSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
