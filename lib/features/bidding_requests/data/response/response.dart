import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BiddingRequestsResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<BiddingRequestsDataResponse>? data;

  @JsonKey(name: "pagination")
  PaginationResponse? pagination;

  BiddingRequestsResponse({this.status, this.message, this.data, this.pagination});

  // From JSON
  factory BiddingRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$BiddingRequestsResponseFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$BiddingRequestsResponseToJson(this);
}

@JsonSerializable()
class BiddingRequestsDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "purchase_invoice_id")
  String? purchaseInvoiceId;

  @JsonKey(name: "payment_date")
  String? paymentDate;

  @JsonKey(name: "advertisement_id")
  String? advertisementId;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "bidding_date")
  String? biddingDate;

  @JsonKey(name: "expiry_time")
  String? expiryTime;

  @JsonKey(name: "price")
  num? price;

  @JsonKey(name: "purchase_tax")
  num? purchaseTax;

  @JsonKey(name: "price_after_tax")
  num? priceAfterTax;

  @JsonKey(name: "received_date")
  String? receivedDate;

  @JsonKey(name: "quantity")
  String? quantity;

  @JsonKey(name: "accepted_by_owner")
  int? acceptedByOwner;

  BiddingRequestsDataResponse({
    this.id,
    this.purchaseInvoiceId,
    this.paymentDate,
    this.advertisementId,
    this.title,
    this.biddingDate,
    this.expiryTime,
    this.price,
    this.purchaseTax,
    this.priceAfterTax,
    this.receivedDate,
    this.quantity,
    this.acceptedByOwner,
  });

  // From JSON
  factory BiddingRequestsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BiddingRequestsDataResponseFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$BiddingRequestsDataResponseToJson(this);
}
