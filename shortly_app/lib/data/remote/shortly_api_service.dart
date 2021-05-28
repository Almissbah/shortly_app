import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
part 'shortly_api_service.g.dart';

@RestApi(baseUrl: "https://api.shrtco.de/v2")
abstract class ShortlyApiService {
  factory ShortlyApiService(Dio dio) = _ShortlyApiService;

  @GET("/shorten")
  Future<HttpResponse<ShortenUrlResponse>> shortenLink(
    @Query("url") String url,
  );
}
