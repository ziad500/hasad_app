import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/bidding/all/data/response/orders_response.dart';
import 'package:hasad_app/features/bidding/all/domain/models/orders_model.dart';

extension BiddingOrdersListResponseMapper on BiddingOrdersListResponse? {
  BiddingOrdersListModel toDomain() {
    return BiddingOrdersListModel(this?.status, this?.message,
        this?.data?.map((e) => e.toDomain()).toList(), this?.pagination.toDomain());
  }
}

extension BiddingOrderResponseMapper on BiddingOrderResponse? {
  BiddingOrderModel toDomain() {
    return BiddingOrderModel(
        this?.purchaseInvoiceId,
        this?.advertisementId,
        this?.title,
        this?.biddingDate,
        this?.expiryTime,
        this?.purchaseTax,
        this?.priceAfterTax,
        this?.price,
        this?.paymentdate,
        this?.receivedDate,
        this?.purchase.toDomain());
  }
}

extension PurchaseResponseMapper on PurchaseResponse? {
  PurchaseModel toDomain() {
    return PurchaseModel(this?.invoiceNumber, this?.isReceived, this?.isConfirmed, this?.isPaid,
        this?.isRefunded, this?.rejectReason);
  }
}
