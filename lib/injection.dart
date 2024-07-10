// ignore_for_file: non_constant_identifier_names
import 'package:get_it/get_it.dart';
import 'package:tripy_ev_stable/app/view/app.dart';
import 'package:tripy_ev_stable/app/view_model/app_view_model.dart';
import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/providers/auth_providers/auth_http_provider.dart';
import 'package:tripy_ev_stable/providers/auth_providers/auth_mock_provider.dart';
import 'package:tripy_ev_stable/providers/location_providers/location_geolocator_provider.dart';
import 'package:tripy_ev_stable/providers/transaction_providers/transaction_http_provider.dart';
import 'package:tripy_ev_stable/providers/transaction_providers/transaction_mock_provider.dart';
import 'package:tripy_ev_stable/repositories/auth_repository.dart';
import 'package:tripy_ev_stable/repositories/location_repository.dart';
import 'package:tripy_ev_stable/repositories/transaction_repository.dart';

import 'package:tripy_ev_stable/routes/__init__.dart';
import 'package:tripy_ev_stable/routes/keys.dart';

import 'package:tripy_ev_stable/services/app_theme_service.dart';
import 'package:tripy_ev_stable/services/auth_service.dart';
import 'package:tripy_ev_stable/services/firebase_notification_service.dart';

import 'package:tripy_ev_stable/services/firebase_service.dart';
import 'package:tripy_ev_stable/services/hive_services.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';
import 'package:tripy_ev_stable/services/locale_notification_service.dart';
import 'package:tripy_ev_stable/services/localization_cache_service.dart';
import 'package:tripy_ev_stable/services/location_service.dart';

import 'package:tripy_ev_stable/services/oriantation_service.dart';
import 'package:tripy_ev_stable/services/sentry_service.dart';
import 'package:tripy_ev_stable/services/transaction_service.dart';

import 'package:tripy_ev_stable/services/vexana_service.dart';
import 'package:tripy_ev_stable/services/wakelock_service.dart';

final Inject = GetIt.instance;
App get app => Inject<App>();
Router get router => Inject<Router>();
AppViewModel get appViewModel => Inject<AppViewModel>();

class DependencyInjection {
  static final DependencyInjection instance = DependencyInjection._internal();

  factory DependencyInjection() {
    return instance;
  }

  DependencyInjection._internal();
  void init() {
    _addInjection<Router>(
      provider: Router(initialKey: AppNavigatorKeys.DEFAULT.find),
    );
    _addInjection<AppThemeService>(
      provider: AppThemeService(),
    );

    _addInjection<Config>(
      provider: Config(),
    );

    _addInjection<FirebaseNotificationService>(
      provider: FirebaseNotificationService(),
    );
    _addInjection<AppViewModel>(
      provider: AppViewModel(),
    );
    _addInjection<OriantationService>(
      provider: OriantationService(),
    );
    _addInjection<HiveService>(
      provider: HiveService(),
    );
    _addInjection<LocalCacheService>(
      provider: LocalCacheService(),
    );
    _addInjection<LocalizationCacheService>(
      provider: LocalizationCacheService(),
    );
    _addInjection<FirebaseService>(
      provider: FirebaseService(),
    );
    _addInjection<WakeLockService>(
      provider: WakeLockService(),
    );
    _addInjection<LocaleNotification>(
      provider: LocaleNotification(),
    );
    _addInjection<SentryService>(
      provider: SentryService(),
    );
    _addInjection<VexanaService>(
      provider: VexanaService(),
    );
    _addInjection<LocationRepository>(
      provider: LocationService(
        provider: LocationGeolocatorProvider(),
      ),
    );
    _addInjection<TransactionRepository>(
      provider: TransactionService(
        provider: GetProvider(
          http: TransactionHttpProvider(),
          mock: TransactionMockProvider(),
        ),
      ),
    );
        _addInjection<AuthRepository>(
      provider: AuthService(
        provider: GetProvider(
          http: AuthHttpProvider(),
          mock: AuthMockProvider(),
        ),
      ),
    );
    // HTTP---SERVICES
  }

  dynamic GetProvider({
    required Object http,
    required Object mock,
  }) {
    if (Config().get.DataType == "http") {
      return http;
    } else {
      return mock;
    }
  }

  void _addInjection<T extends Object>({
    required T provider,
    String? instanceName,
  }) {
    Inject.registerLazySingleton<T>(
      () => provider,
      instanceName: instanceName,
    );
  }
}
