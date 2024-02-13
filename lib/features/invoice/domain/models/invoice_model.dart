import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

class DirectSelligInvoiceModel {
  bool? status;
  String? message;
  DirectSellingInvoiceDataModel? data;

  DirectSelligInvoiceModel(this.status, this.message, this.data);
}

class DirectSellingInvoiceDataModel {
  String? invoiceNumber;
  num? subtotal;
  num? tax;
  num? total;
  DirectSellingInvoiceadvertisementModel? advertisement;
  String? createdAt;

  DirectSellingInvoiceDataModel(
      this.invoiceNumber, this.subtotal, this.tax, this.total, this.advertisement, this.createdAt);
}

class DirectSellingInvoiceadvertisementModel {
  int? id;
  String? advertisementTypeId;
  String? title;
  String? description;
  LocationModel? region;
  LocationModel? city;
  LocationModel? district;
  num? price;
  List<LocationModel>? images;
  DirectSellingInvoiceadvertisementModel(
    this.id,
    this.advertisementTypeId,
    this.title,
    this.description,
    this.region,
    this.city,
    this.district,
    this.price,
    this.images,
  );
}
