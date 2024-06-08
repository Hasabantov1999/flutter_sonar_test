import 'package:hive_flutter/hive_flutter.dart';
part 'app_filter_schema.g.dart';
@HiveType(typeId: 3)
class AppFilterSchema extends HiveObject {
  AppFilterSchema({
    this.socketType,
    this.powerType,
    this.stationType,
    this.maximumDistance,
    this.minumumDistance,
  });

  @HiveField(0)
  final String? socketType;
  @HiveField(1)
  final String? powerType;
  @HiveField(2)
  final String? stationType;
  @HiveField(3)
  final int? minumumDistance;
  @HiveField(4)
  final int? maximumDistance;
}
