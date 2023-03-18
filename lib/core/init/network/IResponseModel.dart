// ignore: file_names
abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {
  void statusCode() {}
}

class ResponseModel<T> extends IResponseModel<T> {

  ResponseModel({this.data, this.error});
  @override
  // ignore: overridden_fields
  final T? data;
  @override
  // ignore: overridden_fields
  final IErrorModel? error;
}
