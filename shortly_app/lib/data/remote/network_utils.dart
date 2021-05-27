import 'dart:io';

import 'package:dio/dio.dart'; 
import 'package:retrofit/retrofit.dart';
import 'package:shortly_app/data/remote/resource.dart';

class RetrofitResponseHandler<T> {
  Future<Resource<T>> handle(Future<HttpResponse<T>> future) async {
    Resource<T> resource;
    var response;
    try {
      response = await future;

      resource = SuccessResource<T>(response.data);
    } catch (error) {
      if (error.runtimeType == DioError &&
          (error as DioError).response != null) {
        final res = (error as DioError).response;

        resource = _handleResponse(res);
      } else if (error is TypeError) {
      } else {}
    }

    return resource;
  }

  FailureResource<T, HttpError> _handleResponse(Response res) {
    FailureResource failureResource;
    failureResource = FailureResource<T, HttpError>(
        HttpError(ResponseErrors.ApiError, res.statusCode), "");
    return failureResource;
  }
}
