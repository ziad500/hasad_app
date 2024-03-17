import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class SliderResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<SliderDataResponse>? data;

  SliderResponse({this.message, this.status, this.data});

  // from json
  factory SliderResponse.fromJson(Map<String, dynamic> json) => _$SliderResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$SliderResponseToJson(this);
}

@JsonSerializable()
class SliderDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "path")
  String? path;

  SliderDataResponse({this.id, this.path});

  // from json
  factory SliderDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SliderDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$SliderDataResponseToJson(this);
}
