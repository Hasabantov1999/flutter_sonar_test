import 'package:hive/hive.dart';
import 'package:tripy_ev_stable/public/theme/__init__.dart';
import 'package:tripy_ev_stable/schemas/local/app_filter_schema/app_filter_schema.dart';

part "app_cache_schema.g.dart";

@HiveType(typeId: 0)
class AppCacheSchema extends HiveObject {
  @HiveField(0)
  AppThemes? theme;
  @HiveField(1)
  String? locale;
  @HiveField(2)
  String? accessToken;
  @HiveField(3)
  bool? introduceView;
  @HiveField(4)
  AppFilterSchema? stationFilters;
}
