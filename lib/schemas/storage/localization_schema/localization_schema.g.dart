// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizationSchemaAdapter extends TypeAdapter<LocalizationSchema> {
  @override
  final int typeId = 2;

  @override
  LocalizationSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalizationSchema(
      locale: fields[0] == null ? 'tr' : fields[0] as String?,
      translates:
          fields[1] == null ? {} : (fields[1] as Map?)?.cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalizationSchema obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.locale)
      ..writeByte(1)
      ..write(obj.translates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
