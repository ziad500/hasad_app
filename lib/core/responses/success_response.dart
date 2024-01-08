import 'package:json_annotation/json_annotation.dart';

part 'success_response.g.dart';

@JsonSerializable()
class SuccessResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;

  SuccessResponse({this.message, this.status});

  // from json
  factory SuccessResponse.fromJson(Map<String, dynamic> json) => _$SuccessResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$SuccessResponseToJson(this);
}

class SuccessModel {
  bool? status;
  String? message;

  SuccessModel(this.message, this.status);
}

extension SuccessResponseMapper on SuccessResponse? {
  SuccessModel toDomain() {
    return SuccessModel(this?.message, this?.status);
  }
}
