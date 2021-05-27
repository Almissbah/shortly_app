import 'package:json_annotation/json_annotation.dart';

part 'shorten_url_request.g.dart';

@JsonSerializable()
class ShortenUrlRequest {
  String url; 

  ShortenUrlRequest(
      {this.url, });

  factory ShortenUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$ShortenUrlRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ShortenUrlRequestToJson(this);
}
