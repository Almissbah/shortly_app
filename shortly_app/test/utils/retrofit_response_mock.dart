import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class RetrofitReponseMocker {
  static Future<HttpResponse<String>> get200Response() async{
 Future.delayed(Duration(seconds: 1));
    return throw DioError(response: Response(statusCode: 500)); 
  }
  static Future<HttpResponse<String>> get404Response() async{
    throw DioError(response: Response(statusCode: 404));
  }

  static Future<HttpResponse<String>> get500Response() async {
 throw DioError(response: Response(statusCode: 500));
    
  }
}