// ignore_for_file: non_constant_identifier_names

import 'package:tripy_ev_stable/schemas/http/response_schema/response_schema.dart';

ResponseSchema ErrorSchemaBuilder(Map<String, dynamic> data, int? statusCode) {
  return ResponseSchema().set(
    data,
    status: statusCode,
  );
}
