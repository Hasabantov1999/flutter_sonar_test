import 'package:tripy_ev_stable/repositories/base_repository.dart';
import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';

abstract class AuthRepository implements BaseRepository {
  Future<ResponseSchema?> login({
    required Map<String, dynamic> parameters,
  });
  Future<ResponseSchema?> loginVerify({
    required Map<String, dynamic> parameters,
  });
  Future<ResponseSchema?> resetRequest({
    required Map<String, dynamic> parameters,
  });
  Future<ResponseSchema?> resetVerify({
    required Map<String, dynamic> parameters,
  });
  Future<ResponseSchema?> register({
    required Map<String, dynamic> parameters,
  });
}
