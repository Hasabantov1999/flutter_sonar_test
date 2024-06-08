import 'package:hive_flutter/hive_flutter.dart';
part 'localization_schema.g.dart';

@HiveType(typeId: 2)
class LocalizationSchema extends HiveObject {
  @HiveField(0, defaultValue: "tr")
  String? locale;
  @HiveField(1, defaultValue: {})
  Map<String, String>? translates;
  LocalizationSchema({
    required this.locale,
    required this.translates,
  });
}
