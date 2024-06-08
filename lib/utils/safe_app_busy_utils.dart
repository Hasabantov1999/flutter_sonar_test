// ignore_for_file: non_constant_identifier_names


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'package:tripy_ev_stable/core/components/app_loading_area.dart';
import 'package:tripy_ev_stable/core/components/app_top_alert.dart';
import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';

import 'package:tripy_ev_stable/utils/developer_error_log_utils.dart';

GlobalKey _networkState = GlobalKey();
Future<T?> SafeAppBusy<T>(
  Future<dynamic> Function() process, {
  VoidCallback? onException,
}) async {
  try {
    setAppBusy(true);
    if (!(await _checkConnectivity())) {
      if (_networkState.currentContext != null) {

      }
      setAppBusy(false);
    }
    Future.delayed(const Duration(seconds: 30), () {
      if (appBusy.value["busy"] == true) {
        setAppBusy(false);
      }
    });
    final result = await process();
    if (result is ResponseSchema) {
      final res = result.message;
      if (res is String) {
        AppTopAlert.show(description: res);
      } else if (res is List) {
        String mess = "";
        if (res.length == 1) {
          mess = res[0];
        } else {
          for (var element in res) {
            mess += element.toString();
            mess += '\n';
          }
        }

        AppTopAlert.show(description: mess);
      }
    }
    return result;
  } catch (e, stackTrace) {
    if (onException != null) {
      onException();
    }

    DeveloperErrorLog.instance.logService(
      e,
      stackTrace,
      "SafeAppBusy",
    );
  } finally {
    setAppBusy(false);
  }
  return null;
}

Future<bool> _checkConnectivity() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) return false;
  return true;
}
