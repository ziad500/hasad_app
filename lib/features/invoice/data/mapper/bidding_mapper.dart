import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/invoice/data/response/bidding_invoice_response.dart';
import 'package:hasad_app/features/invoice/domain/models/bidding.dart';

extension InvoiceadvertisementResponseMapper on BiddingInvoiceadvertisementResponse? {
  BiddingInvoiceadvertisementModel toDomain() {
    return BiddingInvoiceadvertisementModel(
        this?.id,
        this?.advertisementTypeId,
        this?.title,
        this?.description,
        this?.region.toDomain(),
        this?.city.toDomain(),
        this?.district.toDomain(),
        this?.purchasingPrice,
        this?.auctionPrice,
        this?.biddingDate,
        this?.expiryTime,
        this?.closed,
        this?.numberOfAuctions,
        this?.images);
  }
}

extension BiddingInvoiceDataResponseMapper on BiddingInvoiceDataResponse? {
  BiddingInvoiceDataModel toDomain() {
    return BiddingInvoiceDataModel(this?.invoiceNumber, this?.subtotal, this?.tax, this?.total,
        this?.advertisement.toDomain());
  }
}

extension BiddingInvoiceResponseMapper on BiddingInvoiceResponse? {
  BiddingInvoiceModel toDomain() {
    return BiddingInvoiceModel(this?.status, this?.message, this?.data.toDomain());
  }
}
