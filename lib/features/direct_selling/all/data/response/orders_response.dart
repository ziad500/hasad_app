import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/responses/pagination_response.dart';

part 'orders_response.g.dart';

@JsonSerializable()
class DirectSellingOrdersListResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<DirectSellingOrderResponse>? data;
  @JsonKey(name: "pagination")
  PaginationResponse? pagination;

  DirectSellingOrdersListResponse({this.status, this.message, this.data, this.pagination});

  // from json
  factory DirectSellingOrdersListResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingOrdersListResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingOrdersListResponseToJson(this);
}

@JsonSerializable()
class DirectSellingOrderResponse {
  @JsonKey(name: "purchase_invoice_id")
  int? purchaseInvoiceId;
  @JsonKey(name: "advertisement_id")
  int? advertisementId;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  num? price;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "received_date")
  String? receivedDate;

  DirectSellingOrderResponse(
      {this.purchaseInvoiceId,
      this.advertisementId,
      this.title,
      this.description,
      this.price,
      this.createdAt,
      this.receivedDate});

  // from json
  factory DirectSellingOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingOrderResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingOrderResponseToJson(this);
}
