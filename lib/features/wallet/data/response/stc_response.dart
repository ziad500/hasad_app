import 'package:json_annotation/json_annotation.dart';

part 'stc_response.g.dart';

@JsonSerializable()
class StchRechargeResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  StcRechargeDataResponse? data;

  StchRechargeResponse({this.message, this.status, this.data});

  // from json
  factory StchRechargeResponse.fromJson(Map<String, dynamic> json) =>
      _$StchRechargeResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$StchRechargeResponseToJson(this);
}

@JsonSerializable()
class StcRechargeDataResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "url")
  String? url;

  StcRechargeDataResponse({this.id, this.url});
  // from json
  factory StcRechargeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$StcRechargeDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$StcRechargeDataResponseToJson(this);
}
