import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/repositories/auth_repository.dart';
import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';
import 'package:tripy_ev_stable/services/vexana_service.dart';
import 'package:vexana/vexana.dart';

class AuthHttpProvider implements AuthRepository {
  @override
  Future<ResponseSchema?> login({
    required Map<String, dynamic> parameters,
  }) async {
    final result = await Inject.get<VexanaService>()
        .authManager
        .send<ResponseSchema, ResponseSchema>(
          "auth/login",
          parseModel: ResponseSchema(),
          method: RequestType.POST,
          data: parameters,
        );
    return result.data ?? result.error?.model;
  }

  @override
  Future<ResponseSchema?> loginVerify({
    required Map<String, dynamic> parameters,
  }) async {
    final result = await Inject.get<VexanaService>()
        .authManager
        .send<ResponseSchema, ResponseSchema>(
          "auth/login/verify",
          parseModel: ResponseSchema(),
          method: RequestType.POST,
          data: parameters,
        );
    return result.data ?? result.error?.model;
  }

  @override
  Future<ResponseSchema?> resetRequest({
    required Map<String, dynamic> parameters,
  }) async {
    final result = await Inject.get<VexanaService>()
        .authManager
        .send<ResponseSchema, ResponseSchema>(
          "auth/password/reset",
          parseModel: ResponseSchema(),
          method: RequestType.POST,
          data: parameters,
        );
    return result.data ?? result.error?.model;
  }

  @override
  Future<ResponseSchema?> resetVerify({
    required Map<String, dynamic> parameters,
  }) async {
    final result = await Inject.get<VexanaService>()
        .authManager
        .send<ResponseSchema, ResponseSchema>(
          "auth/password/reset/verify",
          parseModel: ResponseSchema(),
          method: RequestType.POST,
          data: parameters,
        );
    return result.data ?? result.error?.model;
  }

  @override
  Future<ResponseSchema?> register({
    required Map<String, dynamic> parameters,
  }) async {
    final result = await Inject.get<VexanaService>()
        .authManager
        .send<ResponseSchema, ResponseSchema>(
          "auth/register",
          parseModel: ResponseSchema(),
          method: RequestType.POST,
          data: parameters,
        );
    return result.data ?? result.error?.model;
  }
}
