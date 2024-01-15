/* import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/responses/pagination_response.dart';

part 'response.g.dart';

@JsonSerializable()
class BiddingOrdersListResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<BiddingOrderResponse>? data;
  @JsonKey(name: "pagination")
  PaginationResponse? pagination;

  BiddingOrdersListResponse({this.status, this.message, this.data, this.pagination});

  // from json
  factory BiddingOrdersListResponse.fromJson(Map<String, dynamic> json) =>
      _$BiddingOrdersListResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BiddingOrdersListResponseToJson(this);
}

@JsonSerializable()
class BiddingOrderResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "advertisement_type_id")
  int? advertisement_type_id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "purchasing_price")
  num? purchasing_price;
  @JsonKey(name: "auction_price")
  num? auction_price;
  @JsonKey(name: "bidding_date")
  String? bidding_date;
  @JsonKey(name: "expiry_time")
  String? expiry_time;
  @JsonKey(name: "purchasing_price")
  num? purchasing_price;
  @JsonKey(name: "purchasing_price")
  num? purchasing_price;
  @JsonKey(name: "created_at")
  String? createdAt;
  BiddingOrderResponse({
    this.purchaseInvoiceId,
    this.advertisementId,
    this.title,
    this.description,
    this.price,
    this.createdAt,
  });

  // from json
  factory BiddingOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$BiddingOrderResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BiddingOrderResponseToJson(this);
}
 */