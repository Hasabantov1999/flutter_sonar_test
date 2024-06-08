// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_filter_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppFilterSchemaAdapter extends TypeAdapter<AppFilterSchema> {
  @override
  final int typeId = 3;

  @override
  AppFilterSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppFilterSchema(
      socketType: fields[0] as String?,
      powerType: fields[1] as String?,
      stationType: fields[2] as String?,
      maximumDistance: fields[4] as int?,
      minumumDistance: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AppFilterSchema obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.socketType)
      ..writeByte(1)
      ..write(obj.powerType)
      ..writeByte(2)
      ..write(obj.stationType)
      ..writeByte(3)
      ..write(obj.minumumDistance)
      ..writeByte(4)
      ..write(obj.maximumDistance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppFilterSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
