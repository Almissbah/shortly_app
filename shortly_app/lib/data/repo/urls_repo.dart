import 'package:shortly_app/data/remote/model/shorten_url_request.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
import 'package:shortly_app/data/remote/resource.dart';

abstract class UrlsRepository {
  Future<Resource<ShortenUrlResponse>> shortenUrl(ShortenUrlRequest request);
  Future<Resource> storeUrlData(UrlData urlData);
  Future<Resource<List<UrlData>>> getStoredUrlDatas();
}
