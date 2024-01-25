import 'package:json_annotation/json_annotation.dart';

import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';

part 'bidding_invoice_response.g.dart';

@JsonSerializable()
class BiddingInvoiceResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  BiddingInvoiceDataResponse? data;

  BiddingInvoiceResponse({this.status, this.message, this.data});

  // from json
  factory BiddingInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$BiddingInvoiceResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BiddingInvoiceResponseToJson(this);
}

@JsonSerializable()
class BiddingInvoiceDataResponse {
  @JsonKey(name: "invoice_number")
  String? invoiceNumber;
  @JsonKey(name: "subtotal")
  num? subtotal;
  @JsonKey(name: "tax")
  num? tax;
  @JsonKey(name: "total")
  num? total;
  @JsonKey(name: "advertisement")
  BiddingInvoiceadvertisementResponse? advertisement;
  BiddingInvoiceDataResponse({
    this.invoiceNumber,
    this.subtotal,
    this.tax,
    this.total,
    this.advertisement,
  });

  // from json
  factory BiddingInvoiceDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BiddingInvoiceDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BiddingInvoiceDataResponseToJson(this);
}

@JsonSerializable()
class BiddingInvoiceadvertisementResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "advertisement_type_id")
  String? advertisementTypeId;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "region")
  LocationResponse? region;
  @JsonKey(name: "city")
  LocationResponse? city;
  @JsonKey(name: "district")
  LocationResponse? district;
  @JsonKey(name: "purchasing_price")
  num? purchasingPrice;
  @JsonKey(name: "auction_price")
  num? auctionPrice;
  @JsonKey(name: "bidding_date")
  String? biddingDate;
  @JsonKey(name: "expiry_time")
  String? expiryTime;
  @JsonKey(name: "closed")
  String? closed;
  @JsonKey(name: "number_of_auctions")
  num? numberOfAuctions;
  @JsonKey(name: "images")
  List<String>? images;
  BiddingInvoiceadvertisementResponse({
    this.id,
    this.advertisementTypeId,
    this.title,
    this.description,
    this.region,
    this.city,
    this.district,
    this.purchasingPrice,
    this.auctionPrice,
    this.biddingDate,
    this.expiryTime,
    this.closed,
    this.numberOfAuctions,
    this.images,
  });

  // from json
  factory BiddingInvoiceadvertisementResponse.fromJson(Map<String, dynamic> json) =>
      _$BiddingInvoiceadvertisementResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BiddingInvoiceadvertisementResponseToJson(this);
}
