import 'package:tripy_ev_stable/core/exceptions/__init__.dart';
import 'package:tripy_ev_stable/utils/developer_error_log_utils.dart';

class AppNullException implements AppExceptions {
  String to({required dynamic e, StackTrace? stackTrace}) {
    DeveloperErrorLog.instance
        .logService(e, stackTrace ?? StackTrace.empty, "nullException");
    return "Exception:$e\nStackTrace:${(stackTrace ?? StackTrace.empty).toString()}";
  }
}
