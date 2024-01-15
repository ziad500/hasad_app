import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/invoice/data/response/response.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';

extension InvoiceadvertisementResponseMapper on InvoiceadvertisementResponse? {
  InvoiceadvertisementModel todomain() {
    return InvoiceadvertisementModel(
        this?.id,
        this?.advertisementTypeId,
        this?.title,
        this?.description,
        this?.region.toDomain(),
        this?.city.toDomain(),
        this?.district.toDomain(),
        this?.price,
        this?.images);
  }
}

extension InvoiceDataResponseMapper on InvoiceDataResponse? {
  InvoiceDataModel toDomain() {
    return InvoiceDataModel(this?.invoiceNumber, this?.subtotal, this?.tax, this?.total,
        this?.advertisement.todomain());
  }
}

extension InvoiceResponseMapper on InvoiceResponse? {
  InvoiceModel toDomain() {
    return InvoiceModel(this?.status, this?.message, this?.data.toDomain());
  }
}
