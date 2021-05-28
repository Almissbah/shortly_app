import 'package:json_annotation/json_annotation.dart';

part 'base_error_response.g.dart';

@JsonSerializable()
class BaseErrorResponse { 
  String error;  
  
  BaseErrorResponse(this.error);

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseErrorResponseToJson(this);
}
