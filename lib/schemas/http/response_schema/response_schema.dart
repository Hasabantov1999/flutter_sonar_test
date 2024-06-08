// ignore_for_file: avoid_relative_lib_imports

import 'package:json_annotation/json_annotation.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

import '../../../default_modules/vexana/lib/vexana.dart';

part 'response_schema.g.dart';

@JsonSerializable()
class ResponseSchema extends INetworkModel<ResponseSchema> {
  dynamic data;
  int? status;
  String? code;
  dynamic message;
  String? description;
  String? version;

  ResponseSchema({
    this.data,
    this.status,
    this.code,
    this.message,
    this.description,
    this.version,
  });

  factory ResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$ResponseSchemaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResponseSchemaToJson(this);

  @override
  ResponseSchema fromJson(Map<String, dynamic> json) {
    return ResponseSchema.fromJson(json);
  }

  ResponseSchema set(dynamic json,
      {int? status,
      String? code,
      dynamic message,
      String? description,
      String? version}) {
    final response = ResponseSchema(
      data: _$ResponseSchemaFromJson(json).data,
      status: status ?? _$ResponseSchemaFromJson(json).status,
      code: code ?? _$ResponseSchemaFromJson(json).code,
      message: message ?? _$ResponseSchemaFromJson(json).message,
      description: description ?? _$ResponseSchemaFromJson(json).description,
      version: version ?? _$ResponseSchemaFromJson(json).version,
    );
    response.toString();
    return response;
  }

  @override
  String toString() {
    String res =
        "Response${data.toString()}\nCode:$code\nStatus:$status\nMessage:$message\nDescription:$description\nVersion:$version";
    DeveloperLog.instance.logWarning(res);
    return res;
  }
}
