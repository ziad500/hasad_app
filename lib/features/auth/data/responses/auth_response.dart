// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class MainUserAuthResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  UserData? data;

  MainUserAuthResponse({this.status, this.message, this.data});

  // from json
  factory MainUserAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$MainUserAuthResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$MainUserAuthResponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  User? user;

  UserData({this.token, this.user});
  // from json
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phone")
  int? phone;
  @JsonKey(name: "stc")
  int? stc;
  @JsonKey(name: "image")
  String? image;
  User({
    this.id,
    this.name,
    this.phone,
    this.stc,
    this.image,
  });

  // from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class InespectorSignUpResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;

  InespectorSignUpResponse({this.status, this.message});
  // from json
  factory InespectorSignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$InespectorSignUpResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$InespectorSignUpResponseToJson(this);
}
