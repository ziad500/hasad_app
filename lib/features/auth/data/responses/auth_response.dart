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
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone_key")
  String? phoneKey;
  @JsonKey(name: "phone_number")
  int? phoneNumber;
  @JsonKey(name: "region")
  String? region;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "district")
  String? district;
  @JsonKey(name: "address_details")
  String? addressDetails;
  @JsonKey(name: "photo")
  String? photo;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneKey,
    this.phoneNumber,
    this.region,
    this.city,
    this.district,
    this.addressDetails,
    this.photo,
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
