import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/responses/pagination_response.dart';

part 'orders_response.g.dart';

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
  @JsonKey(name: "purchase_invoice_id")
  String? purchaseInvoiceId;
  @JsonKey(name: "advertisement_id")
  String? advertisementId;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "bidding_date")
  String? biddingDate;
  @JsonKey(name: "expiry_time")
  String? expiryTime;
  @JsonKey(name: "purchase_tax")
  num? purchaseTax;
  @JsonKey(name: "price_after_tax")
  num? priceAfterTax;
  @JsonKey(name: "price")
  num? price;
  @JsonKey(name: "payment_date")
  String? paymentdate;
  @JsonKey(name: "received_date")
  String? receivedDate;
  @JsonKey(name: "is_confirmed")
  int? isConfirmed;
  BiddingOrderResponse(
      {this.purchaseInvoiceId,
      this.advertisementId,
      this.title,
      this.biddingDate,
      this.expiryTime,
      this.purchaseTax,
      this.priceAfterTax,
      this.price,
      this.paymentdate,
      this.receivedDate,
      this.isConfirmed});

  // from json
  factory BiddingOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$BiddingOrderResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BiddingOrderResponseToJson(this);
}
