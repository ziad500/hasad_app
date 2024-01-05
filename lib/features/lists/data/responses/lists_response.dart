import 'package:json_annotation/json_annotation.dart';

part 'lists_response.g.dart';

@JsonSerializable()
class ListsResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<ListsDataResponse>? data;

  ListsResponse({this.status, this.message, this.data});

  // from json
  factory ListsResponse.fromJson(Map<String, dynamic> json) => _$ListsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ListsResponseToJson(this);
}

@JsonSerializable()
class ListsDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  ListsDataResponse({this.id, this.name, this.image});

  // from json
  factory ListsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ListsDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ListsDataResponseToJson(this);
}
