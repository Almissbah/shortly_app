// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortly_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ShortlyApiService implements ShortlyApiService {
  _ShortlyApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.shrtco.de/v2';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<HttpResponse<ShortenUrlResponse>> shortenLink(url) async {
    ArgumentError.checkNotNull(url, 'url');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'url': url};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/shorten',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ShortenUrlResponse.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}
