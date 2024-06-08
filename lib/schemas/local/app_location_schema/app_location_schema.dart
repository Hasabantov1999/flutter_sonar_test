import 'package:hive/hive.dart';
part 'app_location_schema.g.dart';

@HiveType(typeId: 8)
class AppLocationSchema extends HiveObject {
  @HiveField(0)
  double? lat;
  @HiveField(1)
  double? long;

  AppLocationSchema({
    this.lat,
    this.long,
  });

  factory AppLocationSchema.fromMap(Map<String, dynamic> json) =>
      AppLocationSchema(
        lat: json["lat"]?.toDouble(),
        long: json["lng"]?.toDouble(),
      );

  @override
  String toString() {
    return "$lat,$long";
  }
}
