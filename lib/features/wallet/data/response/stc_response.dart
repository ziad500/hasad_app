import 'package:json_annotation/json_annotation.dart';

part 'stc_response.g.dart';

@JsonSerializable()
class StchRechargeResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  String? url;

  StchRechargeResponse({this.message, this.status, this.url});

  // from json
  factory StchRechargeResponse.fromJson(Map<String, dynamic> json) =>
      _$StchRechargeResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$StchRechargeResponseToJson(this);
}
