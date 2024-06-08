// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tripy_ev_stable/app/view/app.dart';
import 'package:tripy_ev_stable/core/components/app_keyboard_utils.dart';
import 'package:tripy_ev_stable/core/components/app_loading_area.dart';
import 'package:tripy_ev_stable/helpers/sentry_widget_binding_helper.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/routes/keys.dart';
import 'package:tripy_ev_stable/routes/__init__.dart' as route;
import 'package:tripy_ev_stable/routes/routes.dart';
import 'package:tripy_ev_stable/services/firebase_service.dart';
import 'package:tripy_ev_stable/services/hive_services.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';
import 'package:tripy_ev_stable/services/localization_cache_service.dart';
import 'package:tripy_ev_stable/services/oriantation_service.dart';
import 'package:tripy_ev_stable/services/sentry_service.dart';

import 'package:tripy_ev_stable/services/vexana_service.dart';
import 'package:tripy_ev_stable/services/wakelock_service.dart';
import 'package:tripy_ev_stable/utils/app_utils.dart';
import 'package:tripy_ev_stable/utils/developer_error_log_utils.dart';

Future<void> _LoadENV() => dotenv.load();

Future<void> main() async {
  runZonedGuarded(
    () async {
      await _LoadENV();
      DependencyInjection.instance.init();
      await Inject<WakeLockService>().init();
      await Inject<OriantationService>().init();
      await Inject<SentryService>().init();
      await Inject<HiveService>().init();
      await Inject<FirebaseService>().init();
      await Inject<LocalCacheService>().init();
      await Inject<LocalizationCacheService>().init();
      await Inject<VexanaService>().init();

      Inject.registerLazySingleton<App>(
        () => App(
          navigatorKey: AppNavigatorKeys.DEFAULT.find,
          home: Inject<route.Router>().platformType(
            GetInitialPage,
          ),
          viewModel: appViewModel,
          initialLocale: AppInitialLocale,
          supportedLocales: AppSupportedLocales,
          localizationDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorObservers: [
            SentryNavigatorObserver(),
          ],
          widgetExtensions: const [
             AppLoadingWidget(),
             AppKeyboardWidget(),
          ],
        ),
      );  
      runApp(
        SentryWidgetBinding(
          app: app,
        ),
      );
    },
    (error, stack) {
      DeveloperErrorLog.instance.logService(error, stack, "RunZonedGuard");
      Sentry.captureException(error, stackTrace: stack);
      throw stack;
    },
  );
}
