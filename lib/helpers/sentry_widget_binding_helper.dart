import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';



class SentryWidgetBinding extends StatelessWidget {
  const SentryWidgetBinding({
    super.key,
    required this.app,
  });
  final Widget app;
  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: SentryAssetBundle(),
      child: app,
    );
  }
}
