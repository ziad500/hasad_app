import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:json_annotation/json_annotation.dart';

class BiddingRequestsModel {
  bool? status;

  String? message;

  List<BiddingRequestsDataModel>? data;

  PaginationModel? pagination;

  BiddingRequestsModel(this.status, this.message, this.data, this.pagination);
}

@JsonSerializable()
class BiddingRequestsDataModel {
  int? id;

  String? purchaseInvoiceId;

  String? paymentDate;

  String? advertisementId;

  String? title;

  String? biddingDate;

  String? expiryTime;

  num? price;

  num? purchaseTax;

  num? priceAfterTax;

  String? receivedDate;

  String? quantity;

  int? acceptedByOwner;

  BiddingRequestsDataModel(
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
  );
}
