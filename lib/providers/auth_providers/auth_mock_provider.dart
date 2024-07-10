import 'package:tripy_ev_stable/repositories/auth_repository.dart';
import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';

class AuthMockProvider implements AuthRepository {
  @override
  Future<ResponseSchema?> login({required Map<String, dynamic> parameters}) {
    throw UnimplementedError();
  }
  
  @override
  Future<ResponseSchema?> loginVerify({required Map<String, dynamic> parameters}) {
    throw UnimplementedError();
  }
  
  @override
  Future<ResponseSchema?> resetRequest({required Map<String, dynamic> parameters}) {

    throw UnimplementedError();
  }
  
  @override
  Future<ResponseSchema?> resetVerify({required Map<String, dynamic> parameters}) {
    throw UnimplementedError();
  }
  
  @override
  Future<ResponseSchema?> register({required Map<String, dynamic> parameters}) {
    throw UnimplementedError();
  }
}
