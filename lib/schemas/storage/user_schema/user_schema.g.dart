// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSchemaAdapter extends TypeAdapter<UserSchema> {
  @override
  final int typeId = 5;

  @override
  UserSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSchema(
      id: fields[0] as String?,
      username: fields[1] as String?,
      email: fields[2] as String?,
      userPass: fields[3] as String?,
      balance: fields[4] as String?,
      joiningDate: fields[5] as String?,
      type: fields[6] as String?,
      name: fields[7] as String?,
      surname: fields[8] as String?,
      phone: fields[9] as String?,
      year: fields[10] as String?,
      fcmToken: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserSchema obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.userPass)
      ..writeByte(4)
      ..write(obj.balance)
      ..writeByte(5)
      ..write(obj.joiningDate)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.surname)
      ..writeByte(9)
      ..write(obj.phone)
      ..writeByte(10)
      ..write(obj.year)
      ..writeByte(11)
      ..write(obj.fcmToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSchema _$UserSchemaFromJson(Map<String, dynamic> json) => UserSchema(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      userPass: json['user_pass'] as String?,
      balance: json['balance'] as String?,
      joiningDate: json['joining_date'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phone: json['phone'] as String?,
      year: json['year'] as String?,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$UserSchemaToJson(UserSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'user_pass': instance.userPass,
      'balance': instance.balance,
      'joining_date': instance.joiningDate,
      'type': instance.type,
      'name': instance.name,
      'surname': instance.surname,
      'phone': instance.phone,
      'year': instance.year,
      'fcm_token': instance.fcmToken,
    };
