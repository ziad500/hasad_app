import 'package:hasad_app/core/responses/pagination_response.dart';

class SalesOrdersModel {
  bool? status;
  String? message;
  List<SalesOrdersDataModel>? data;
  PaginationModel? pagination;

  SalesOrdersModel(this.status, this.message, this.data, this.pagination);
}

class SalesOrdersDataModel {
  int? id;

  int? purchaseInvoiceId;

  int? isConfirmed;

  int? isPaid;

  int? advertisementId;

  String? title;

  String? description;

  int? quantity;

  double? price;

  String? receivedDate;

  String? createdAt;

  String? confirmationCode;

  PaymentLinksModel? paymentLinks;

  SalesOrdersDataModel(
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
  );
}

class PaymentLinksModel {
  int? id;

  String? price;

  String? tax;

  String? total;

  String? paymentUrl;

  int? advertisementId;

  int? userId;

  int? quantity;

  String? qrCodePath;

  String? createdAt;

  String? updatedAt;

  int? purchaseId;

  PaymentLinksModel(
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
  );
}
