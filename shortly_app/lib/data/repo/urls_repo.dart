import 'package:injectable/injectable.dart';
import 'package:shortly_app/data/local/db/urls_dao.dart';
import 'package:shortly_app/data/remote/model/shorten_url_request.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';
import 'package:shortly_app/data/remote/network_utils.dart';
import 'package:shortly_app/data/remote/resource.dart';
import 'package:shortly_app/data/remote/shortly_api_service.dart';

import '../../injection.dart';

abstract class UrlsRepository {
  Future<Resource<ShortenUrlResponse>> shortenUrl(ShortenUrlRequest request);
  Future<Resource> storeUrlData(UrlData urlData);
  Future<Resource<List<UrlData>>> getStoredUrlDatas();
}


@Singleton(
    as: UrlsRepository,
    env: [Env.prod])
class UrlsRepositoryImpl extends UrlsRepository {
  final ShortlyApiService apiService;
  final UrlsDao urlsDao;
  UrlsRepositoryImpl(this.apiService, this.urlsDao);
  @override
  Future<Resource<List<UrlData>>> getStoredUrlDatas() async {
    var list = await urlsDao.findAllUrls();
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
}
