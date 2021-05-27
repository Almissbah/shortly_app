import 'package:json_annotation/json_annotation.dart';

part 'shorten_url_response.g.dart';

@JsonSerializable()
class ShortenUrlResponse {
  bool ok;
  @JsonKey(name: 'result')
  final UrlData urlData;
  ShortenUrlResponse({
    this.urlData,
  });

  factory ShortenUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortenUrlResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShortenUrlResponseToJson(this);
}

@JsonSerializable()
class UrlData {
  String code;
  @JsonKey(name: 'short_link')
  final String shortLink;
  @JsonKey(name: 'full_short_link')
  final String fullShortLink;
  @JsonKey(name: 'short_link2')
  final String shortLink2;
  @JsonKey(name: 'full_short_link2')
  final String fullShortLink2;
  @JsonKey(name: 'share_link')
  final String shareLink;
  @JsonKey(name: 'full_share_link')
  final String fullShareLink;
  @JsonKey(name: 'original_link')
  final String originalLink;

  UrlData(
    this.shortLink,
    this.fullShortLink,
    this.shortLink2,
    this.fullShortLink2,
    this.shareLink,
    this.fullShareLink,
    this.originalLink,
  );

  factory UrlData.fromJson(Map<String, dynamic> json) =>
      _$UrlDataFromJson(json);
  Map<String, dynamic> toJson() => _$UrlDataToJson(this);
}
