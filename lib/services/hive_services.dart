import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:tripy_ev_stable/public/theme/__init__.dart';
import 'package:tripy_ev_stable/schemas/local/app_filter_schema/app_filter_schema.dart';

import 'package:tripy_ev_stable/schemas/storage/app_cache_schema/app_cache_schema.dart';
import 'package:tripy_ev_stable/schemas/storage/localization_schema/localization_schema.dart';

import 'package:tripy_ev_stable/services/base_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

class HiveService implements BaseService {
  @override
  Future<void> init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    String appDocPath = appDocDir.path;

    await Hive.initFlutter(appDocPath);
    _adapters();
    DeveloperLog.instance.logSuccess("Hive Created Succesfully");
  }

  _adapters() {
    Hive.registerAdapter(
      AppCacheSchemaAdapter(),
    );
    Hive.registerAdapter(
      LocalizationSchemaAdapter(),
    );
    Hive.registerAdapter(
      AppThemesAdapter(),
    );
    Hive.registerAdapter(
      AppFilterSchemaAdapter(),
    );
  }
}
