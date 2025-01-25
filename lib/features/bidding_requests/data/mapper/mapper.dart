import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/bidding_requests/data/response/response.dart';
import 'package:hasad_app/features/bidding_requests/domain/models/model.dart';

extension BiddingRequestsDataResponseMapper on BiddingRequestsDataResponse? {
  BiddingRequestsDataModel toDomain() {
    return BiddingRequestsDataModel(
        this?.id,
        this?.purchaseInvoiceId,
        this?.paymentDate,
        this?.advertisementId,
        this?.title,
        this?.biddingDate,
        this?.expiryTime,
        this?.price,
        this?.purchaseTax,
        this?.priceAfterTax,
        this?.receivedDate,
        this?.quantity,
        this?.acceptedByOwner);
  }
}

extension BiddingRequestsResponseMapper on BiddingRequestsResponse? {
  BiddingRequestsModel toDomain() {
    return BiddingRequestsModel(this?.status, this?.message,
        this?.data?.map((e) => e.toDomain()).toList(), this?.pagination.toDomain());
  }
}
