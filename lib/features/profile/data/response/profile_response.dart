// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  ProfileDataResponse? data;

  ProfileResponse({this.status, this.message, this.data});

  // from json
  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class ProfileDataResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phone')
  int? phone;
  @JsonKey(name: 'stc')
  int? stc;
  @JsonKey(name: 'image')
  String? image;
  ProfileDataResponse({
    this.id,
    this.name,
    this.phone,
    this.stc,
    this.image,
  });

  // from json
  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ProfileDataResponseToJson(this);
}
