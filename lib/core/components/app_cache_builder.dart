import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/schemas/storage/app_cache_schema/app_cache_schema.dart';

class AppCacheBuilder extends StatelessWidget {
  const AppCacheBuilder({super.key, required this.builder});
  final Widget Function(BuildContext, AppCacheSchema, Widget?) builder;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<AppCacheSchema?>(Config().get.StorageCacheKey).listenable(),
      builder: (context, box, child) {
        return builder(context,
            box.get(Config().get.StorageCacheBox) ?? AppCacheSchema(), child);
      },
    );
  }
}
