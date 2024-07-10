import 'package:tripy_ev_stable/repositories/auth_repository.dart';
import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';
import 'package:tripy_ev_stable/utils/safe_app_busy_utils.dart';

class AuthService implements AuthRepository {
  AuthService({
    required this.provider,
  });
  final AuthRepository provider;
  @override
  Future<ResponseSchema?> login({
    required Map<String, dynamic> parameters,
  }) async {
    final res = await SafeAppBusy(
      () => provider.login(
        parameters: parameters,
      ),
    );
    return res;
  }

  @override
  Future<ResponseSchema?> loginVerify({
    required Map<String, dynamic> parameters,
  }) async {
    final res = await SafeAppBusy(
      () => provider.loginVerify(
        parameters: parameters,
      ),
    );
    return res;
  }

  @override
  Future<ResponseSchema?> resetRequest({
    required Map<String, dynamic> parameters,
  }) async {
    final res = await SafeAppBusy(
      () => provider.resetRequest(
        parameters: parameters,
      ),
    );
    return res;
  }

  @override
  Future<ResponseSchema?> resetVerify({
    required Map<String, dynamic> parameters,
  }) async {
    final res = await SafeAppBusy(
      () => provider.resetVerify(
        parameters: parameters,
      ),
    );
    return res;
  }

  @override
  Future<ResponseSchema?> register({
    required Map<String, dynamic> parameters,
  }) async {
    final res = await SafeAppBusy(
      () => provider.register(
        parameters: parameters,
      ),
    );
    return res;
  }
}
