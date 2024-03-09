import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/direct_selling/all/data/response/orders_response.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/orders_model.dart';

extension DirectSellingOrderResponseMapper on DirectSellingOrderResponse? {
  DirectSellingOrderModel toDomain() {
    return DirectSellingOrderModel(this?.purchaseInvoiceId, this?.advertisementId, this?.title,
        this?.description, this?.price, this?.createdAt, this?.receivedDate, this?.quantity);
  }
}

extension DirectSellingOrdersListResponseMapper on DirectSellingOrdersListResponse? {
  DirectSellingOrdersListModel toDomain() {
    return DirectSellingOrdersListModel(this?.status, this?.message,
        this?.data?.map((e) => e.toDomain()).toList(), this?.pagination.toDomain());
  }
}
