import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/invoice/data/response/response.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';

extension InvoiceadvertisementResponseMapper on DirectSellingInvoiceadvertisementResponse? {
  DirectSellingInvoiceadvertisementModel todomain() {
    return DirectSellingInvoiceadvertisementModel(
        this?.id,
        this?.advertisementTypeId,
        this?.title,
        this?.description,
        this?.region.toDomain(),
        this?.city.toDomain(),
        this?.district.toDomain(),
        this?.price,
        this?.images?.map((e) => e.toDomain()).toList());
  }
}

extension InvoiceDataResponseMapper on DirectSellingInvoiceDataResponse? {
  DirectSellingInvoiceDataModel toDomain() {
    return DirectSellingInvoiceDataModel(this?.invoiceNumber, this?.subtotal, this?.tax,
        this?.total, this?.advertisement.todomain());
  }
}

extension InvoiceResponseMapper on DirectSellingInvoiceResponse? {
  DirectSelligInvoiceModel toDomain() {
    return DirectSelligInvoiceModel(this?.status, this?.message, this?.data.toDomain());
  }
}
