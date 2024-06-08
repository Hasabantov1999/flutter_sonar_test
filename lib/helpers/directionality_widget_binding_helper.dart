import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/core/components/app_cache_builder.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';

class DirectionalityDataWidgetBinding extends StatelessWidget {
  const DirectionalityDataWidgetBinding({
    super.key,
    required this.app,
  });
  final Widget app;
  @override
  Widget build(BuildContext context) {
    return AppCacheBuilder(
      builder: (context, cache, child) {
        return Directionality(
          textDirection: _control,
          child: app,
        );
      },
    );
  }
}

TextDirection get _control {
  String locale = LocalCacheService().get.model().locale ?? "tr";
  if (locale == "ar" ||
      locale == "ary" ||
      locale == "aao" ||
      locale == "arz" ||
      locale == "ary" ||
      locale == "apd" ||
      locale == "ayn" ||
      locale == "acq" ||
      locale == "fr") {
    return TextDirection.rtl;
  } else {
    return TextDirection.ltr;
  }
}
