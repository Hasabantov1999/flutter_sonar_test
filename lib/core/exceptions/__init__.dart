import 'package:tripy_ev_stable/utils/developer_error_log_utils.dart';

abstract interface class AppExceptions {
  factory AppExceptions({dynamic message, StackTrace? stackTrace}) =>
      _Exception(message, stackTrace);
}

/// Default implementation of [Exception] which carries a message.
class _Exception implements AppExceptions {
  final dynamic message;
  final StackTrace? stackTrace;
  _Exception([this.message, this.stackTrace]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    DeveloperErrorLog.instance
        .logService(message, stackTrace ?? StackTrace.empty, "AppExceptions");
    return "Exception: $message\nStackTrace:${(stackTrace ?? StackTrace.empty).toString()}";
  }
}
