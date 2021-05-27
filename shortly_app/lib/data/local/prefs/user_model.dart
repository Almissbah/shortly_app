import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  UserStatus userStatus;
  User({this.userStatus = UserStatus.FirstTimeUser});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

enum UserStatus { FirstTimeUser, OldUser }
