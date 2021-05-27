 
abstract class Resource<T> {
  final T payload;
  Resource(this.payload);
}

class LoadingResource extends Resource<LoadingPayload> {
  LoadingResource({LoadingPayload payload}) : super(payload);
}
 class LoadingPayload {}

class SuccessResource<T> extends Resource<T> {
  SuccessResource(T payload) : super(payload);
}
 
class FailureResource<T, E extends ErrorPayload> extends Resource<T> {
  final String msg;
  final E errorPayload;
  FailureResource(this.errorPayload, this.msg) : super(null);
}

abstract class ErrorPayload {}

enum ResponseErrors { ConnectionError, ApiError,}

class HttpError extends ErrorPayload {
  ResponseErrors error; 
  int statusCode;
  HttpError(this.error,this.statusCode);
 
}

 
