import 'package:json_annotation/json_annotation.dart';

import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';

part 'response.g.dart';

@JsonSerializable()
class DirectSellingInvoiceResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  DirectSellingInvoiceDataResponse? data;

  DirectSellingInvoiceResponse({this.status, this.message, this.data});

  // from json
  factory DirectSellingInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingInvoiceResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingInvoiceResponseToJson(this);
}

@JsonSerializable()
class DirectSellingInvoiceDataResponse {
  @JsonKey(name: "invoice_number")
  String? invoiceNumber;
  @JsonKey(name: "subtotal")
  num? subtotal;
  @JsonKey(name: "tax")
  num? tax;
  @JsonKey(name: "total")
  num? total;
  @JsonKey(name: "advertisement")
  DirectSellingInvoiceadvertisementResponse? advertisement;
  DirectSellingInvoiceDataResponse({
    this.invoiceNumber,
    this.subtotal,
    this.tax,
    this.total,
    this.advertisement,
  });

  // from json
  factory DirectSellingInvoiceDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingInvoiceDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingInvoiceDataResponseToJson(this);
}

@JsonSerializable()
class DirectSellingInvoiceadvertisementResponse {
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
  @JsonKey(name: "price")
  num? price;
  @JsonKey(name: "images")
  List<String>? images;
  DirectSellingInvoiceadvertisementResponse({
    this.id,
    this.advertisementTypeId,
    this.title,
    this.description,
    this.region,
    this.city,
    this.district,
    this.price,
    this.images,
  });

  // from json
  factory DirectSellingInvoiceadvertisementResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectSellingInvoiceadvertisementResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$DirectSellingInvoiceadvertisementResponseToJson(this);
}
