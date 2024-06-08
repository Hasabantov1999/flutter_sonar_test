import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/app/view_model/app_view_model.dart';
import 'package:tripy_ev_stable/core/components/app_cache_builder.dart';
import 'package:tripy_ev_stable/helpers/directionality_widget_binding_helper.dart';
import 'package:tripy_ev_stable/helpers/pixel_perfect_binding_helper.dart';
import 'package:tripy_ev_stable/helpers/theme_binding_helper.dart';
import 'package:tripy_ev_stable/public/theme/__init__.dart';
import 'package:tripy_ev_stable/services/app_theme_service.dart';
import 'package:stacked/stacked.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.navigatorObservers,
    this.theme,
    this.navigatorKey,
    this.localizationDelegates,
    this.supportedLocales,
    required this.home,
    required this.viewModel,
    this.widgetExtensions,
    this.initialLocale,
    this.scaffoldMessengerKey,
  });
  final List<NavigatorObserver>? navigatorObservers;
  final ThemeData? theme;
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final List<LocalizationsDelegate>? localizationDelegates;
  final List<Locale>? supportedLocales;
  final Widget home;
  final List<Widget>? widgetExtensions;
  final Locale? initialLocale;
  final AppViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => viewModel,
      onViewModelReady: (viewModel) {
        viewModel.init(context);
      },
      builder: (context, viewModel, child) {
        return DirectionalityDataWidgetBinding(
          app: PixelPerfectWidgetBinding(
            app: AppCacheBuilder(
              builder: (context, cache, child) {
                return ThemeDataWidgetBinding(
                  builder: (context, thm) {
                    return MaterialApp(
                      navigatorKey: navigatorKey,
                      scaffoldMessengerKey: scaffoldMessengerKey,
                      navigatorObservers: navigatorObservers ?? [],
                      debugShowCheckedModeBanner: false,
                      theme: cache.theme == null
                          ? AppThemeService().get.getCurrentTheme
                          : cache.theme!.get,
                      localizationsDelegates: localizationDelegates,
                      supportedLocales: supportedLocales ?? [],
                      locale: initialLocale,
                      home: home,
                      builder: (context, child) {
                        return Stack(
                          children: [
                            child ?? const SizedBox.shrink(),
                            ...widgetExtensions ?? []
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
