import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class DirectSellingDetailsResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  DirectSellingDataResponse? data;

  DirectSellingDetailsResponse({this.status, this.message, this.data});

  // from json
  factory DirectSellingDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingDetailsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingDetailsResponseToJson(this);
}
