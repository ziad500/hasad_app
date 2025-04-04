import 'package:hasad_app/core/responses/pagination_response.dart';

class BiddingOrdersListModel {
  bool? status;
  String? message;
  List<BiddingOrderModel>? data;
  PaginationModel? pagination;

  BiddingOrdersListModel(this.status, this.message, this.data, this.pagination);
}

class BiddingOrderModel {
  String? purchaseInvoiceId;
  String? advertisementId;
  String? title;
  String? biddingDate;
  String? expiryTime;
  num? purchaseTax;
  num? priceAfterTax;
  num? price;
  String? paymentdate;
  String? receivedDate;
  PurchaseModel? purchase;
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
      this.receivedDate,
      this.purchase);
}

class PurchaseModel {
  int? invoiceNumber;
  int? isReceived;
  int? isConfirmed;
  int? isPaid;
  int? isRefunded;
  String? rejectReason;
  PurchaseModel(this.invoiceNumber, this.isReceived, this.isConfirmed, this.isPaid, this.isRefunded,
      this.rejectReason);
}
