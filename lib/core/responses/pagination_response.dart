import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart';

@JsonSerializable()
class PaginationResponse {
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "prev_page_url")
  String? prevPageUrl;
  @JsonKey(name: "next_page_url")
  String? nextPageUrl;

  PaginationResponse(
      {this.currentPage, this.lastPage, this.nextPageUrl, this.prevPageUrl, this.total});

  // from json
  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}

class PaginationModel {
  int? total;
  int? currentPage;
  int? lastPage;
  String? prevPageUrl;
  String? nextPageUrl;

  PaginationModel(this.currentPage, this.lastPage, this.nextPageUrl, this.prevPageUrl, this.total);
}

extension PaginationResponseMapper on PaginationResponse? {
  PaginationModel toDomain() {
    return PaginationModel(
        this?.currentPage, this?.lastPage, this?.nextPageUrl, this?.prevPageUrl, this?.total);
  }
}
