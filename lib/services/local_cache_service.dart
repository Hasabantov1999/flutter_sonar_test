import 'package:hive_flutter/hive_flutter.dart';
import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/schemas/storage/app_cache_schema/app_cache_schema.dart';
import 'package:tripy_ev_stable/services/base_service.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

extension LocalCacheServiceExtension on LocalCacheService {
  LocalCacheService get get => Inject.get<LocalCacheService>();
}

class LocalCacheService implements BaseService {
  Box<AppCacheSchema?>? _box;

  Box<AppCacheSchema?> get getBox => _box!;

  AppCacheSchema model() {
    if (_box?.get(Config().get.AppType) == null) {
      init().then((value) {
        return _box!.get(Config().get.StorageCacheBox)!;
      });
    }

    return _box!.get(Config().get.StorageCacheBox)!;
  }

  Future<void> setModel(AppCacheSchema appCacheModel) async {
    _box!.put(Config().get.StorageCacheBox, appCacheModel);
  }

  @override
  Future<void> init() async {
    _box = await Hive.openBox<AppCacheSchema?>(Config().get.StorageCacheKey);
    if (_box?.get(Config().get.StorageCacheBox) == null) {
      await _box?.put(
        Config().get.StorageCacheBox,
        AppCacheSchema(),
      );
      DeveloperLog.instance.logSuccess(
        "AppCacheSchema Created Succesfully",
      );
    }
    DeveloperLog.instance.logInfo(
      "Cache Request: ${DateTime.now().toIso8601String()}",
    );
  }
}
