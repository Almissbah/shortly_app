import 'package:injectable/injectable.dart';
import 'package:shortly_app/data/local/db/urls_dao.dart';
import 'package:shortly_app/data/remote/model/shorten_url_request.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
import 'package:shortly_app/data/remote/network_utils.dart';
import 'package:shortly_app/data/remote/resource.dart';
import 'package:shortly_app/data/remote/shortly_api_service.dart';

abstract class UrlsRepository {
  Future<Resource<ShortenUrlResponse>> shortenUrl(ShortenUrlRequest request);
  Future<Resource> storeUrlData(UrlData urlData);
  Future<Resource> deleteStoredUrl(UrlData urlData);
  Future<Resource<List<UrlData>>> getStoredUrlDatas();
  List<UrlData> getCachedUrls();
}

@Singleton(as: UrlsRepository)
class UrlsRepositoryImpl extends UrlsRepository {
  final ShortlyApiService apiService;
  final UrlsDao urlsDao;
  List<UrlData> cachedUrls = [];
  UrlsRepositoryImpl(this.apiService, this.urlsDao);
  @override
  Future<Resource<List<UrlData>>> getStoredUrlDatas() async {
    var list = await urlsDao.findAllUrls();
    cachedUrls = list;
    return SuccessResource<List<UrlData>>(list);
  }

  @override
  Future<Resource<ShortenUrlResponse>> shortenUrl(ShortenUrlRequest request) {
    return RetrofitResponseHandler<ShortenUrlResponse>()
        .handle(apiService.shortenLink(request.url));
  }

  @override
  Future<Resource> storeUrlData(UrlData urlData) async {
    await urlsDao.insertUrl(urlData);
    return SuccessResource(urlData);
  }

  @override
  List<UrlData> getCachedUrls() {
    return cachedUrls;
  }

  @override
  Future<Resource> deleteStoredUrl(UrlData urlData) async {
    await urlsDao.deleteUrl(urlData.id);
     return SuccessResource(urlData);
  }
}
