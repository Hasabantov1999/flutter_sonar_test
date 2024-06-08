import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/services/base_service.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class WakeLockService implements BaseService {
  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    WakelockPlus.enable();
  }
}
