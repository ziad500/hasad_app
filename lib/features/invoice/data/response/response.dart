import 'package:json_annotation/json_annotation.dart';

import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';

part 'response.g.dart';

@JsonSerializable()
class InvoiceResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  InvoiceDataResponse? data;

  InvoiceResponse({this.status, this.message, this.data});

  // from json
  factory InvoiceResponse.fromJson(Map<String, dynamic> json) => _$InvoiceResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
}

@JsonSerializable()
class InvoiceDataResponse {
  @JsonKey(name: "invoice_number")
  String? invoiceNumber;
  @JsonKey(name: "subtotal")
  num? subtotal;
  @JsonKey(name: "tax")
  num? tax;
  @JsonKey(name: "total")
  num? total;
  @JsonKey(name: "advertisement")
  InvoiceadvertisementResponse? advertisement;
  InvoiceDataResponse({
    this.invoiceNumber,
    this.subtotal,
    this.tax,
    this.total,
    this.advertisement,
  });

  // from json
  factory InvoiceDataResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$InvoiceDataResponseToJson(this);
}

@JsonSerializable()
class InvoiceadvertisementResponse {
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
  InvoiceadvertisementResponse({
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
  factory InvoiceadvertisementResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceadvertisementResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$InvoiceadvertisementResponseToJson(this);
}
