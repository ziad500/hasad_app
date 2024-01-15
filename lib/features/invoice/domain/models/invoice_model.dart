import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

class InvoiceModel {
  bool? status;
  String? message;
  InvoiceDataModel? data;

  InvoiceModel(this.status, this.message, this.data);
}

class InvoiceDataModel {
  String? invoiceNumber;
  num? subtotal;
  num? tax;
  num? total;
  InvoiceadvertisementModel? advertisement;
  InvoiceDataModel(
    this.invoiceNumber,
    this.subtotal,
    this.tax,
    this.total,
    this.advertisement,
  );
}

class InvoiceadvertisementModel {
  int? id;
  String? advertisementTypeId;
  String? title;
  String? description;
  LocationModel? region;
  LocationModel? city;
  LocationModel? district;
  num? price;
  List<String>? images;
  InvoiceadvertisementModel(
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
