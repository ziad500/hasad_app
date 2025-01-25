import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/sales_order/data/response/response.dart';
import 'package:hasad_app/features/sales_order/domain/models/model.dart';

extension SalesOrdersDataResponseMapper on SalesOrdersDataResponse? {
  SalesOrdersDataModel toDomain() {
    return SalesOrdersDataModel(
        this?.id,
        this?.purchaseInvoiceId,
        this?.isConfirmed,
        this?.isPaid,
        this?.advertisementId,
        this?.title,
        this?.description,
        this?.quantity,
        this?.price,
        this?.receivedDate,
        this?.createdAt,
        this?.confirmationCode,
        this?.paymentLinks.toDomain());
  }
}

extension SalesOrdersResponseMapper on SalesOrdersResponse? {
  SalesOrdersModel toDomain() {
    return SalesOrdersModel(this?.status, this?.message,
        this?.data?.map((e) => e.toDomain()).toList(), this?.pagination.toDomain());
  }
}

extension PaymentLinksResponseMapper on PaymentLinksResponse? {
  PaymentLinksModel toDomain() {
    return PaymentLinksModel(
        this?.id,
        this?.price,
        this?.tax,
        this?.total,
        this?.paymentUrl,
        this?.advertisementId,
        this?.userId,
        this?.quantity,
        this?.qrCodePath,
        this?.createdAt,
        this?.updatedAt,
        this?.purchaseId);
  }
}
