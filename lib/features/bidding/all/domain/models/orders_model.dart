import 'package:hasad_app/core/responses/pagination_response.dart';

class BiddingOrdersListModel {
  bool? status;
  String? message;
  List<BiddingOrderModel>? data;
  PaginationModel? pagination;

  BiddingOrdersListModel(this.status, this.message, this.data, this.pagination);
}

class BiddingOrderModel {
  int? purchaseInvoiceId;
  String? advertisementId;
  String? title;
  String? biddingDate;
  String? expiryTime;
  num? purchaseTax;
  num? priceAfterTax;
  num? price;
  String? paymentdate;
  BiddingOrderModel(
    this.purchaseInvoiceId,
    this.advertisementId,
    this.title,
    this.biddingDate,
    this.expiryTime,
    this.purchaseTax,
    this.priceAfterTax,
    this.price,
    this.paymentdate,
  );
}
