import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class SalesOrdersResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<SalesOrdersDataResponse>? data;
  @JsonKey(name: "pagination")
  PaginationResponse? pagination;

  SalesOrdersResponse({this.status, this.message, this.data, this.pagination});

  // from json
  factory SalesOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$SalesOrdersResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$SalesOrdersResponseToJson(this);
}

@JsonSerializable()
class SalesOrdersDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "purchase_invoice_id")
  int? purchaseInvoiceId;

  @JsonKey(name: "is_confirmed")
  int? isConfirmed;

  @JsonKey(name: "is_paid")
  int? isPaid;

  @JsonKey(name: "advertisement_id")
  int? advertisementId;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "quantity")
  int? quantity;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "received_date")
  String? receivedDate;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "confirmation_code")
  String? confirmationCode;

  @JsonKey(name: "payment_links")
  PaymentLinksResponse? paymentLinks;

  SalesOrdersDataResponse({
    this.id,
    this.purchaseInvoiceId,
    this.isConfirmed,
    this.isPaid,
    this.advertisementId,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.receivedDate,
    this.createdAt,
    this.confirmationCode,
    this.paymentLinks,
  });

  /// From JSON
  factory SalesOrdersDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SalesOrdersDataResponseFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$SalesOrdersDataResponseToJson(this);
}

@JsonSerializable()
class PaymentLinksResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "tax")
  String? tax;

  @JsonKey(name: "total")
  String? total;

  @JsonKey(name: "payment_url")
  String? paymentUrl;

  @JsonKey(name: "advertisement_id")
  int? advertisementId;

  @JsonKey(name: "user_id")
  int? userId;

  @JsonKey(name: "quantity")
  int? quantity;

  @JsonKey(name: "qr_code_path")
  String? qrCodePath;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  @JsonKey(name: "purchase_id")
  int? purchaseId;

  PaymentLinksResponse({
    this.id,
    this.price,
    this.tax,
    this.total,
    this.paymentUrl,
    this.advertisementId,
    this.userId,
    this.quantity,
    this.qrCodePath,
    this.createdAt,
    this.updatedAt,
    this.purchaseId,
  });

  // From JSON
  factory PaymentLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentLinksResponseFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$PaymentLinksResponseToJson(this);
}
