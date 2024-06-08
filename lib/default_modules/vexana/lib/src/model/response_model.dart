
import '../../vexana.dart';

class ResponseModel<T, E extends INetworkModel<E>?>
    extends IResponseModel<T?, E> {
  ResponseModel({T? data, IErrorModel<E>? error,required dynamic response,required int statusCode}) : super(data, error,response,statusCode);
}
