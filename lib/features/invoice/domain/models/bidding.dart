import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

class BiddingInvoiceModel {
  bool? status;
  String? message;
  BiddingInvoiceDataModel? data;
  BiddingInvoiceModel(this.status, this.message, this.data);
}

class BiddingInvoiceDataModel {
  String? invoiceNumber;
  num? subtotal;
  num? tax;
  num? total;
  BiddingInvoiceadvertisementModel? advertisement;
  BiddingInvoiceDataModel(
    this.invoiceNumber,
    this.subtotal,
    this.tax,
    this.total,
    this.advertisement,
  );
}

class BiddingInvoiceadvertisementModel {
  int? id;
  String? advertisementTypeId;
  String? title;
  String? description;
  LocationModel? region;
  LocationModel? city;
  LocationModel? district;
  num? purchasingPrice;
  num? auctionPrice;
  String? biddingDate;
  String? expiryTime;
  String? closed;
  num? numberOfAuctions;
  List<LocationModel>? images;
  BiddingInvoiceadvertisementModel(
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
  );
}
