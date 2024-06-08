import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_schema.g.dart';
@JsonSerializable()
@HiveType(typeId:5)
class UserSchema extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? email;
  @HiveField(3)
  @JsonKey(name: "user_pass")
  String? userPass;
  @HiveField(4)
  String? balance;
  @HiveField(5)
  @JsonKey(name: "joining_date")
  String? joiningDate;
  @HiveField(6)
  String? type;
  @HiveField(7)
  String? name;
  @HiveField(8)
  String? surname;
  @HiveField(9)
  String? phone;
  @HiveField(10)
  String? year;
  @HiveField(11)
  @JsonKey(name: "fcm_token")
  String? fcmToken;

  UserSchema({
    this.id,
    this.username,
    this.email,
    this.userPass,
    this.balance,
    this.joiningDate,
    this.type,
    this.name,
    this.surname,
    this.phone,
    this.year,
    this.fcmToken,
  });
   factory UserSchema.fromJson(Map<String, dynamic> json) => _$UserSchemaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserSchemaToJson(this);
}
