import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tripy_ev_stable/core/exceptions/__init__.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/routes/transitions.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';
import 'dart:ui' as ui;

import 'package:tripy_ev_stable/utils/keyboard_utils.dart';

class Routes {
  final Widget mobile;
  final String path;
  final Widget? webOrDesktop;
  final Widget? tablet;
  final TransitionType transitionType;
  final Future<bool> Function()? routeGuard;
  final List<Future<bool> Function()>? multipleRouteGuard;

  const Routes({
    required this.mobile,
    this.webOrDesktop,
    this.tablet,
    required this.path,
    this.transitionType = TransitionType.native,
    this.routeGuard,
    this.multipleRouteGuard,
  });
}

extension RouterExtension on Router {
  Router get get => Inject<Router>();
}

class Router {
  final GlobalKey<NavigatorState> initialKey;
  Router({
    required this.initialKey,
  });
  Future<bool> _guard(Routes route) async {
    if (route.routeGuard != null) {
      return await route.routeGuard!();
    }
    return true;
  }

  void navigate([GlobalKey<NavigatorState>? key, String? path]) {
           KeyboardClose();
    (key ?? initialKey).currentState!.popUntil(
      (route) {
        if (route.settings.name != (path ?? '/')) {
          return false;
        }
        return true;
      },
    );
  }

  bool canPop([GlobalKey<NavigatorState>? key]) {
    if ((key ?? initialKey).currentState!.canPop()) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _checkRouteGuards(Routes route) async {
    bool isRouteGuard = true;
    for (var element in route.multipleRouteGuard ?? []) {
      if (!(await element())) {
        isRouteGuard = false;
      }
    }
    return isRouteGuard;
  }

  bool isNull(GlobalKey<NavigatorState>? key) {
    if ((key) == null) {
      DeveloperLog.instance.logError(AppExceptions(
          message: "Please provide global key to run application context!"));
      return true;
    } else {
      return false;
    }
  }

  Widget platformType(Routes page) {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      return page.webOrDesktop ?? page.mobile;
    }
    if (Platform.isAndroid || Platform.isIOS) {
      final firstDevice = ui.PlatformDispatcher.instance.views.first;
      final windowWidth =
          firstDevice.physicalSize.width / firstDevice.devicePixelRatio;

      if (windowWidth > 600) {
        return page.tablet ?? page.mobile;
      } else {
        return page.mobile;
      }
    }

    return const SizedBox.shrink();
  }

  void go(Routes page, {GlobalKey<NavigatorState>? key}) async {
    if (isNull(key ?? initialKey)) throw Exception();
    if (!(await _guard(page))) throw Exception();
    if (!(await _checkRouteGuards(page))) throw Exception();
    (key ?? initialKey).currentState!.pushAndRemoveUntil(
          CupertinoPageRoute(
            builder: (context) => platformType(page),
            settings: RouteSettings(
              name: page.path,
            ),
          ),
          (route) => false,
        );
  }

  void pop<T extends Object?>({T? result, GlobalKey<NavigatorState>? key}) {
    if (isNull(key ?? initialKey)) throw Exception();
    (key ?? initialKey).currentState!.pop(result);
  }

  Future<T?> push<T>(Routes page,
      {bool? opaque, GlobalKey<NavigatorState>? key}) async {
    if (isNull(key ?? initialKey)) throw Exception();
    if (!(await _guard(page))) throw Exception();
    if (!(await _checkRouteGuards(page))) throw Exception();

    if (opaque != null && !opaque) {
      return (key ?? initialKey).currentState!.push(
            PageRouteBuilder(
              opaque: opaque,
              settings: RouteSettings(
                name: page.path,
              ),
              pageBuilder: (context, _, __) {
                return platformType(page);
              },
            ),
          );
    }
    return (key ?? initialKey).currentState!.push(
          CupertinoPageRoute(
            builder: (context) => platformType(page),
            settings: RouteSettings(
              name: page.path,
            ),
          ),
        );
  }

  void cleanFocus({GlobalKey<NavigatorState>? key}) {
           KeyboardClose();
  }

  Future<T?> modalPush<T>(Widget page, {GlobalKey<NavigatorState>? key}) async {
    cleanFocus(key: key);
    return showCupertinoModalPopup(
      context: (key ?? initialKey).currentContext!,
      builder: (context) => page,
    );
  }

  Future<T?> dialogPush<T>(Widget page,
      {bool barrierDismissible = true, GlobalKey<NavigatorState>? key}) async {
    cleanFocus(key: key);
    return showCupertinoDialog(
      context: (key ?? initialKey).currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (context) => page,
    );
  }
}
