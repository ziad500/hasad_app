import 'package:hasad_app/core/responses/pagination_response.dart';

class DirectSellingOrdersListModel {
  bool? status;
  String? message;
  List<DirectSellingOrderModel>? data;
  PaginationModel? pagination;

  DirectSellingOrdersListModel(this.status, this.message, this.data, this.pagination);
}

class DirectSellingOrderModel {
  int? purchaseInvoiceId;
  int? advertisementId;
  String? title;
  String? description;
  num? price;
  String? createdAt;
  String? receivedDate;
  int? quantity;

  DirectSellingOrderModel(this.purchaseInvoiceId, this.advertisementId, this.title,
      this.description, this.price, this.createdAt, this.receivedDate, this.quantity);
}
