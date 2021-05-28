// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorten_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortenUrlResponse _$ShortenUrlResponseFromJson(Map<String, dynamic> json) {
  return ShortenUrlResponse(
    urlData: json['result'] == null
        ? null
        : UrlData.fromJson(json['result'] as Map<String, dynamic>),
  )..ok = json['ok'] as bool;
}

Map<String, dynamic> _$ShortenUrlResponseToJson(ShortenUrlResponse instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'result': instance.urlData,
    };

UrlData _$UrlDataFromJson(Map<String, dynamic> json) {
  return UrlData(
    shortLink: json['short_link'] as String,
    fullShortLink: json['full_short_link'] as String,
    shortLink2: json['short_link2'] as String,
    fullShortLink2: json['full_short_link2'] as String,
    shareLink: json['share_link'] as String,
    fullShareLink: json['full_share_link'] as String,
    originalLink: json['original_link'] as String,
    id: json['id'] as int,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$UrlDataToJson(UrlData instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'short_link': instance.shortLink,
      'full_short_link': instance.fullShortLink,
      'short_link2': instance.shortLink2,
      'full_short_link2': instance.fullShortLink2,
      'share_link': instance.shareLink,
      'full_share_link': instance.fullShareLink,
      'original_link': instance.originalLink,
    };
